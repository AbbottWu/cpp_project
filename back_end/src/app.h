#pragma once
#include <iostream>
#include <vector>
#include <grpcpp/server.h>
#include "question.h"
#include "user.h"
#include "data_engine.h"
#include "spdlog/spdlog.h"
#include "grpc.h"


using namespace std;
class App {
	// 注意,所有app类方法的指针指向的都是临时变量.
	// 如需加入到总序列中,需要通过复制构造函数创建新实例

public:
	static App& get_instance(DataEngine*);
	bool local_register(const shared_ptr<User>&);
	bool local_login(const shared_ptr<User>&);
	vector<shared_ptr<Question>> all_questions(bool);
	vector<shared_ptr<Question>> my_questions(const shared_ptr<User>&);
	bool ask_question(const pair<shared_ptr<User>, shared_ptr<Question>>&);
	bool answer_question(const pair<shared_ptr<User>, shared_ptr<Question>>&);
	vector<shared_ptr<User>>::iterator find_user(const shared_ptr<User>&);
	vector<shared_ptr<Question>>::iterator find_question(const shared_ptr<Question>&);
    std::unique_ptr<spdlog::logger> logger;
    std::unique_ptr<grpc::Server> server;
    void RunServer();
	~App();

private:
	DataEngine* engine;
	explicit App(DataEngine*);
	App(const App&) = delete; // NOLINT(modernize-use-equals-delete)
	const App& operator=(const App&) = delete; // NOLINT(modernize-use-equals-delete)
	vector<shared_ptr<User>> users;
	vector<shared_ptr<Question>> questions;
};