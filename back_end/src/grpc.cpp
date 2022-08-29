#include "grpc.h"


User *create_tmp_user_from_proto(const app::User *proto_user) {
    User *temp_user = new User(proto_user->name(), proto_user->token(), proto_user->is_answerer());
    return temp_user;
}

grpc::Status RouteImpl::SignUp(grpc::ServerContext *, const app::User *input, app::IsOK *output) {
    cout << "SignUp Called" << endl;
    User *temp_user = create_tmp_user_from_proto(input);
    App &runtime = App::get_instance(nullptr);
    bool result = runtime.local_register(temp_user);
    if (result) {
        cout << "SignUp Success" << endl;
        output->set_success(true);
    }
    cout << "SignUp Failed" << endl;
    output->set_success(false);
    delete temp_user;
    return grpc::Status::OK;
}


grpc::Status RouteImpl::Login(grpc::ServerContext *, const app::User *input, app::IsOK *output) {
    cout << "Login Called" << endl;
    App &runtime = App::get_instance(nullptr);
    User *temp_user = create_tmp_user_from_proto(input);
    bool result = runtime.local_login(temp_user);
    if (result) {
        output->set_success(true);
        cout << "Login Success" << endl;
    }
    output->set_success(false);
    cout << "Login Failed" << endl;
    delete temp_user;
    return grpc::Status::OK;
}

grpc::Status
RouteImpl::AllQuestions(grpc::ServerContext *, const app::RequestQuestions *input, app::Questions *output) {
    cout << "All Questions Called" << endl;
    App &runtime = App::get_instance(nullptr);
    auto temp_questions = runtime.all_questions(input->is_answered());
    for (auto question: temp_questions) {
        auto one_question = output->add_questions();
        one_question->set_title(question->get_title());
        one_question->set_content(question->get_content());
        one_question->set_id(question->get_id());
        one_question->set_category(question->get_category());
        one_question->set_answered(question->is_answered());
        one_question->set_answer(question->get_answer());
    }
    cout << "All Questions Success" << endl;
    return grpc::Status::OK;
}

grpc::Status RouteImpl::MyQuestions(grpc::ServerContext *, const app::RequestQuestions *input, app::Questions *output) {
    cout << "My Questions Called" << endl;
    App &runtime = App::get_instance(nullptr);
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
