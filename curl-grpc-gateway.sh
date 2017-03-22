#!/bin/bash

# For now insert curl process
docker exec -it grpc-gateway curl -X POST -d '{"name": "david"}' http://localhost:8080/v1/hello
echo
docker exec -it grpc-gateway curl -X POST -d '{"name": "david"}' http://localhost:8080/v1/helloagain
echo

