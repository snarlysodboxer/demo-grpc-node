#!/bin/bash

docker run -it --rm -v $(pwd):/code -w /code --entrypoint /usr/bin/protoc snarlysodboxer/protoc-grpc-gateway:latest -I/usr/include -I./protos -I. -I/go/src -I/go/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis --swagger_out=logtostderr=true:./generated protos/helloworld.proto

