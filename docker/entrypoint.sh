#!/bin/bash

cd /data/starcoin-airdrop-api

while true
do
#	./starcoin-airdrop-api_linux_amd64 $@ >> ./starcoin-airdrop-api.log
  ./starcoin-airdrop-api_linux_amd64
	echo "$(date) starcoin-airdrop-api start"
	sleep 3
done
