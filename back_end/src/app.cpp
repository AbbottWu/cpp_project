#include <iostream>
#include "app.h"
#include <algorithm>
#include <memory>
#include "spdlog/sinks/stdout_color_sinks.h"
#include "spdlog/sinks/rotating_file_sink.h"


using namespace std;

App::App(DataEngine *_engine) {
    auto console_sink = std::make_shared<spdlog::sinks::stdout_color_sink_mt>();
    console_sink->set_level(spdlog::level::info);

    auto file_sink = std::make_shared<spdlog::sinks::rotating_file_sink_mt>("./my_log.txt", 1024 * 1024 * 10, 3);
    file_sink->set_level(spdlog::level::trace);

    unique_ptr<spdlog::logger> tmp_point(new spdlog::logger("Server", {console_sink, file_sink}));
    logger = std::move(tmp_point);

    logger->set_level(spdlog::level::info);
    logger->info("Logger created. Log file can be found at ./my_log.txt");

    engine = _engine;
    // Create a file rotating logger with 5mb size max and 3 rotated files
}

App::~App() = default;

App &App::get_instance(DataEngine *_engine) {
    static App instance(_engine);
    return instance;
}

bool App::local_register(const shared_ptr<User>& tmp_user) {
    return engine->local_register(tmp_user);
}

// 通过 username 和 token 找到 users 持久序列中的对象
vector<shared_ptr<User>>::iterator App::find_user(const shared_ptr<User>& tmp_user) {
    return engine->find_user(tmp_user);
}

// 通过 id 找到 questions 持久序列中的对象
vector<shared_ptr<Question>>::iterator App::find_question(const shared_ptr<Question>& tmp_question) {
    return engine->find_question(tmp_question);
}

// 判断临时的对象能否在持久队列中找到,如果能则登录成功,反之则失败
bool App::local_login(const shared_ptr<User>& tmp_user) {
    return engine->local_login(tmp_user);
}

// 返回持久队列中回答过或未回答过的全部问题(持久对象的指针)
vector<shared_ptr<Question>> App::all_questions(bool answered) {
    return engine->all_questions(answered);
}

// 根据临时对象找出持久对象中对应个体的全部问题
vector<shared_ptr<Question>> App::my_questions(const shared_ptr<User>& tmp_user) {
    return engine->my_questions(tmp_user);
}

// 通过临时 user, question 对,进行提问操作
bool App::ask_question(const pair<shared_ptr<User>, shared_ptr<Question>>& UQpair) {
    return engine->ask_question(UQpair);
}

bool App::answer_question(const pair<shared_ptr<User>, shared_ptr<Question>>& UQpair) {
    return engine->answer_question(UQpair);
    // 读取临时对象们
}

void App::RunServer() {
    string server_address = "127.0.0.1:12345";
    RouteImpl service;
    grpc::ServerBuilder builder;
    builder.AddListeningPort(server_address, grpc::InsecureServerCredentials());
    builder.RegisterService(&service);
    server = builder.BuildAndStart();
    logger->info("Server listened on {}", server_address);
    server->Wait();
}

