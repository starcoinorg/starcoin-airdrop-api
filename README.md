### Prerequisites

- Go        : go1.16

### Set Environment Variable

```
export STARCOIN_AIRDROP_MYSQL_HOST=<host>
export STARCOIN_AIRDROP_MYSQL_PORT=<port>
export STARCOIN_AIRDROP_MYSQL_USER=<username>
export STARCOIN_AIRDROP_MYSQL_PWD=<password>
export STARCOIN_AIRDROP_MYSQL_DB=<db>
```

### Init & Run in localhost

```
git clone git@github.com:starcoinorg/starcoin-airdrop-api.git
cd starcoin-airdrop-api
go install
go run main.go
```

visit http://127.0.0.1:8081

### CI/CD
1. build
```
cd docker
./rebuild.sh
```
2. change tag version in kube/airdrop-api-deployment.yaml

3. publish docker image
```
docker images
docker login
docker tag starcoin-airdrop-api:latest starcoin/starcoin-airdrop-api:<VERSION>
docker push starcoin/starcoin-airdrop-api:<VERSION>`
```

3. restart kube serice(kube/README.md)


