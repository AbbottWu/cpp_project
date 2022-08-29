#include "grpc.h"

User *create_tmp_user_from_proto(const app::User *proto_user) {
    User *temp_user = new User(proto_user->name(), proto_user->token(), proto_user->is_answerer());
    return temp_user;
}

grpc::Status RouteImpl::SignUp(grpc::ServerContext *context, const app::User *input, app::IsOK *output) {
    cout << "SignUp called" << endl;
    User *temp_user = create_tmp_user_from_proto(input);
    App &runtime = App::get_instance(nullptr);
    bool local_status = runtime.local_register(temp_user);
    if (!local_status) {
        cout << "SignUp failed" << endl;
        output->set_success(false);
        return grpc::Status::CANCELLED;
    }
    cout << "SignUp success" << endl;
        output->set_success(true);
    return grpc::Status::OK;
}


grpc::Status RouteImpl::Login(grpc::ServerContext *, const app::User *, app::IsOK *) {
    return grpc::Status::OK;
}

grpc::Status RouteImpl::AllQuestions(grpc::ServerContext *, const app::RequestQuestions *, app::Questions *) {
    return grpc::Status::OK;
}

grpc::Status RouteImpl::MyQuestions(grpc::ServerContext *, const app::RequestQuestions *, app::Questions *) {
    return grpc::Status::OK;
}

grpc::Status RouteImpl::AskQuestion(grpc::ServerContext *, const app::Question *, app::IsOK *) {
    return grpc::Status::OK;
}

grpc::Status RouteImpl::AnswerQuestion(grpc::ServerContext *, const app::Question *, app::IsOK *) {
    return grpc::Status::OK;
}

extern void RunServers() {
    std::string server_address = "127.0.0.1:12345";
    RouteImpl service;
    grpc::ServerBuilder builder;
    builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
    builder.RegisterService(&service);
    std::unique_ptr<grpc::Server> server(builder.BuildAndStart());
    std::cout << "Server listening on " << server_address << std::endl;
    server->Wait();
}
