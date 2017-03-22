FROM electrotumbao/golang-protoc:latest

RUN apk update && apk add git
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
RUN go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
RUN go get -u github.com/golang/protobuf/protoc-gen-go
RUN go get -u github.com/googleapis/googleapis || true
RUN go get -u golang.org/x/net/context
RUN go get -u google.golang.org/grpc
RUN go get -u google.golang.org/genproto/googleapis/api/annotations

ENTRYPOINT /bin/sh
CMD ""

