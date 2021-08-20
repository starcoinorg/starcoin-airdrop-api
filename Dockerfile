FROM golang:1.16 AS build

ARG GIT_COMMIT
ARG GIT_DIRTY

ENV GIT_COMMIT=$GIT_COMMIT \
    GIT_DIRTY=$GIT_DIRTY \
    goos="linux" \
    goArch="amd64"

ENV BIN_NAME="starcoin-airdrop-api_${goos}_${goArch}"

WORKDIR /starcoin-airdrop-api
COPY ./ .
RUN go install
RUN GOOS=$goos GOARCH=$goArch go build -ldflags "-X main.GitCommit=${GIT_COMMIT}${GIT_DIRTY}" -o $BIN_NAME
RUN ls -la /starcoin-airdrop-api

FROM golang:1.16

ENV RELEASE_PATH="/starcoin-airdrop-api"

WORKDIR /data/starcoin-airdrop-api
COPY --from=build /starcoin-airdrop-api/starcoin-airdrop-api_linux_amd64 \
     /starcoin-airdrop-api/docker/entrypoint.sh \
     ./
RUN chmod 755 /data/starcoin-airdrop-api/entrypoint.sh

RUN mkdir /data/starcoin-airdrop-api/config
COPY --from=build /starcoin-airdrop-api/config /data/starcoin-airdrop-api/config

RUN ls -la /data/starcoin-airdrop-api

ENTRYPOINT ["/data/starcoin-airdrop-api/entrypoint.sh"]

