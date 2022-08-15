#include "main.h"
#include "echo.pb.h" 
#include "echo.grpc.pb.h"
#include <grpc/grpc.h>
#include <grpcpp/security/server_credentials.h>
#include <grpcpp/server.h>
#include <grpcpp/server_builder.h>
#include <grpcpp/server_context.h>

using namespace std;

class RouteImpl final : public TTry::BaseRoute::Service {
	grpc::Status GetFeature(grpc::ServerContext* context, const TTry::Message* input, TTry::Message* output) {
		output->set_content(input->content());
		cout << input->content() << endl;
		return grpc::Status::OK;
	}
};

using namespace std;

string echo(string s) {
	TTry::Message message;
	message.set_content(s);
	string str = message.Utf8DebugString();
	return str;
}

void RunServer() {
	std::string server_address = "127.0.0.1:12345";
	RouteImpl service;
	grpc::ServerBuilder builder;
	builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
	builder.RegisterService(&service);
	std::unique_ptr<grpc::Server> server(builder.BuildAndStart());
	std::cout << "Server listening on " << server_address << std::endl;
	server->Wait();
}

int main() {
	RunServer();
	return 0;
}