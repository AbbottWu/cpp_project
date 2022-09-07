#include "grpc.h"
#include "app.h"
#include <utility>

User *create_tmp_user_from_proto(const app::User *proto_user) {
    auto tmp_user = new User(proto_user->name(), proto_user->token(), proto_user->is_answerer());
    return tmp_user;
}

Question *create_tmp_question_from_proto(const app::Question *proto_question) {
    auto tmp_question = new Question(proto_question->title(), proto_question->content(), proto_question->id(),
                                     proto_question->category(), proto_question->answered(),
                                     proto_question->answer());
    return tmp_question;
}

grpc::Status RouteImpl::SignUp(grpc::ServerContext *, const app::User *input, app::IsOK *output) {
    shared_ptr<User> tmp_user = shared_ptr<User>( create_tmp_user_from_proto(input));
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("SignUp() Called");
    bool result = runtime.local_register(tmp_user);
    if (result) {
        runtime.logger->info("SignUp() Succeed");
        output->set_success(true);
        return grpc::Status::OK;
    }
    runtime.logger->info("SignUp() failed");
    output->set_success(false);
    return grpc::Status::OK;
}


grpc::Status RouteImpl::Login(grpc::ServerContext *, const app::User *input, app::IsOK *output) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("Login() Called");
    shared_ptr<User> tmp_user = shared_ptr<User>(create_tmp_user_from_proto(input));
    bool result = runtime.local_login(tmp_user);
    if (result) {
        output->set_success(true);
        runtime.logger->info("Login() Succeed");
        return grpc::Status::OK;
    }
    output->set_success(false);
    runtime.logger->info("Login() Failed");
    return grpc::Status::OK;
}

grpc::Status
RouteImpl::AllQuestions(grpc::ServerContext *, const app::RequestQuestions *input, app::Questions *output) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("AllQuestions() Called");
    auto tmp_questions = runtime.all_questions(input->is_answered());
    for (const auto& question: tmp_questions) {
        auto one_question = output->add_questions();
        one_question->set_title(question->get_title());
        one_question->set_content(question->get_content());
        one_question->set_id(question->get_id());
        one_question->set_category(question->get_category());
        one_question->set_answered(question->is_answered());
        one_question->set_answer(question->get_answer());
    }
    runtime.logger->info("AllQuestions() Succeed");
    return grpc::Status::OK;
}

grpc::Status RouteImpl::MyQuestions(grpc::ServerContext *, const app::RequestQuestions *input, app::Questions *output) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("MyQuestions() Called");
    auto tmp_user = shared_ptr<User>(create_tmp_user_from_proto(&input->user()));
    auto tmp_questions = runtime.my_questions(tmp_user);
    for (const auto& question: tmp_questions) {
        auto one_question = output->add_questions();
        one_question->set_title(question->get_title());
        one_question->set_content(question->get_content());
        one_question->set_id(question->get_id());
        one_question->set_category(question->get_category());
        one_question->set_answered(question->is_answered());
        one_question->set_answer(question->get_answer());
    }
    runtime.logger->info("MyQuestions() Succeed");

    return grpc::Status::OK;
}

grpc::Status RouteImpl::AskQuestion(grpc::ServerContext *, const app::UQpair *input, app::IsOK *output) {
    auto tmp_question = shared_ptr<Question>(create_tmp_question_from_proto(&input->question()));
    auto tmp_user = shared_ptr<User>(create_tmp_user_from_proto(&input->user()));
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("AskQuestion() Called");

    if (runtime.ask_question(make_pair(tmp_user, tmp_question))) {
        output->set_success(true);
        runtime.logger->info("AskQuestion() Succeed");
        return grpc::Status::OK;
    }
    output->set_success(false);
    runtime.logger->info("AskQuestion() Failed");
    return grpc::Status::OK;
}

grpc::Status RouteImpl::AnswerQuestion(grpc::ServerContext *, const app::UQpair *input, app::IsOK *output) {
    cout << "AskQuestion() Called" << endl;
    auto tmp_question = shared_ptr<Question>(create_tmp_question_from_proto(&input->question()));
    auto tmp_user = shared_ptr<User>(create_tmp_user_from_proto(&input->user()));
    App &runtime = App::get_instance(nullptr);
    if (runtime.answer_question(make_pair(tmp_user, tmp_question))) {
        output->set_success(true);
        runtime.logger->info("AnswerQuestion() Succeed");
        return grpc::Status::OK;
    }
    output->set_success(false);
    runtime.logger->info("AnswerQuestion() Failed");
    return grpc::Status::OK;
}