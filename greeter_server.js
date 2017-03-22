var PROTO_PATH = __dirname + '/protos/helloworld.proto';

var grpc = require('grpc');
var hello_proto = grpc.load(PROTO_PATH).helloworld;

/**
 * Implements the getUserName RPC method.
 */
function getUserName(call, callback) {
  callback(null, {message: 'Hello ' + call.request.name});
}

function getUserNameAgain(call, callback) {
  callback(null, {message: 'Hello again, ' + call.request.name});
}

/**
 * Starts an RPC server that receives requests for the Greeter service at the
 * sample server port
 */
function main() {
  var server = new grpc.Server();
  server.addProtoService(hello_proto.Greeter.service, {getUserNameAgain: getUserNameAgain, getUserName: getUserName});
  server.bind('127.0.0.1:50051', grpc.ServerCredentials.createInsecure());
  server.start();
}

main();
