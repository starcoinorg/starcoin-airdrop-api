#!/bin/bash

echo "=== container stopping ==="
docker stop starcoin-airdrop-api
docker rm  starcoin-airdrop-api
echo "=== container stopped ==="