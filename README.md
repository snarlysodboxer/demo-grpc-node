# A grpc-gateway demonstration with node

### TODO
* Figure out a best practice for importing proto files from other repos, is it vendorization? Right now we have these:
* * `protos/descriptor.proto` from: [google/protobuf/descriptor.proto](https://github.com/google/protobuf/blob/master/src/google/protobuf/descriptor.proto)
* * `protos/annotations.proto` from: [google/api/annotations.proto](https://github.com/googleapis/googleapis/blob/master/google/api/annotations.proto)
* * `protos/http.proto` from: [google/api/http.proto](https://github.com/googleapis/googleapis/blob/master/google/api/http.proto)

### Credit
Much of this was taken from there places:
* http://www.grpc.io/docs/quickstart/node.html
* https://github.com/grpc-ecosystem/grpc-gateway

