#pragma once
#include <iostream>
#include <vector>
#include "question.h"
#include "user.h"
#include "data_engine.h"
#include "spdlog/spdlog.h"


using namespace std;
class App {
	// 注意,所有app类方法的指针指向的都是临时变量.
	// 如需加入到总序列中,需要通过复制构造函数创建新实例

public:
	static App& get_instance(DataEngine*);
	bool local_register(User*);
	bool local_login(User*);
	vector<Question*> all_questions(bool);
	vector<Question*> my_questions(User*);
	bool ask_question(pair<User*, Question*>);
	bool answer_question(pair<User*, Question*>);
	vector<User*>::iterator find_user(User*);
	vector<Question*>::iterator find_question(Question*);
    std::unique_ptr<spdlog::logger> logger;
	~App();
private:
	DataEngine* engine;
	App(DataEngine*);
	App(const App&) = delete;
	const App& operator=(const App&) = delete;
	vector<User*> users;
	vector<Question*> questions;
};