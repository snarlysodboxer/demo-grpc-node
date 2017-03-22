#!/bin/bash

# This script builds and runs a golang reverse-proxy JSON/REST to gRPC server

set -e

docker run -it --rm -v $(pwd):/code -w /code --entrypoint /usr/bin/protoc snarlysodboxer/protoc-grpc-gateway:latest -I/usr/include -I./protos -I. -I/go/src -I/go/src/github.com/googleapis/googleapis/ --go_out=,plugins=grpc:./generated protos/helloworld.proto
echo "Generated grpc stub"

docker run -it --rm -v $(pwd):/code -w /code --entrypoint /usr/bin/protoc snarlysodboxer/protoc-grpc-gateway:latest -I/usr/include -I./protos -I. -I/go/src -I/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --grpc-gateway_out=logtostderr=true:./generated protos/helloworld.proto
echo "Generated server code"

docker run -it --rm -v $(pwd):/code -w /code --entrypoint go snarlysodboxer/protoc-grpc-gateway:latest build -o generated/grpc-gateway-executable grpc-gateway.go
echo "Built server"

# TODO cheating for now with host networking
echo "Starting server"
docker run -it --rm -v $(pwd):/code -w /code --entrypoint /code/generated/grpc-gateway-executable --net host --name grpc-gateway snarlysodboxer/protoc-grpc-gateway:latest

