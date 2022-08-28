#include <iostream>
#include "app.h"
#include <algorithm>

using namespace std;

App::App(DataEngine* _engine) {
	engine = _engine;
	questions = engine->read_questions();
	users = engine->read_users(questions);
}

App::~App() {

}

App& App::get_instance(DataEngine* _engine) {
	static App instance(_engine);
	return instance;
}

bool App::local_register(User* tmp_user) {
	users.push_back(new User(*tmp_user)); // 通过复制构造函数建立持久对象并存入列表
	return true;
}

// 通过 username 和 token 找到 users 持久序列中的对象
vector<User*>::iterator App::find_user(User* tmp_user) {
	auto result = find_if(users.begin(), users.end(),
		[tmp_user](User* per_user) {
			if ((tmp_user->get_name() == per_user->get_name()) && (tmp_user->get_token() == per_user->get_token()) && (tmp_user->get_isAnswer() == per_user->get_isAnswer()))
			{
				return true;
			}
			return false;
		});
	return result;
}

// 通过 id 找到 questions 持久序列中的对象
vector<Question*>::iterator App::find_question(Question* tmp_question) {
	auto result = find_if(questions.begin(), questions.end(), [tmp_question](Question* question) {
		if (tmp_question->get_id() == question->get_id()) {
			return true;
		}
		return false;
		});
	return result;
}

// 判断临时的对象能否在持久队列中找到,如果能则登录成功,反之则失败
bool App::local_login(User* tmp_user) {
	auto result = find_user(tmp_user);
	if (result == users.end()) {
		return false;
	}
	return true;
}

// 返回持久队列中回答过或未回答过的全部问题(持久对象的指针)
vector<Question*> App::all_questions(bool answered) {
	vector<Question*> tmp;
	copy_if(questions.begin(), questions.end(), back_inserter(tmp),
		[answered](const Question* per_question) {
			if ((per_question->is_answered()) == answered) {
				return true;
			}
			return false;
		});
	return tmp;
}

// 根据临时对象找出持久对象中对应个体的全部问题
vector<Question*> App::my_questions(User* tmp_user) {
	auto result = find_user(tmp_user);
	return (*result)->get_questions();
}

// 通过临时 user, question 对,进行提问操作
bool App::ask_question(pair<User*, Question*> UQpair) {
	auto tmp_user = UQpair.first;
	auto persist_question = new Question(*UQpair.second); // 通过拷贝构造函数建立持久化对象
	questions.push_back(persist_question);  // 存储持久化对象
	auto user_iter = find_user(tmp_user);  // 通过临时对象寻找持久对象
	(*user_iter)->new_question(persist_question);  // 更新持久对象
	return true;
}

bool App::answer_question(pair<User*, Question*> UQpair) {
	// 读取临时对象们
	auto tmp_user = UQpair.first;
	auto tmp_question = UQpair.second;
	auto question_iter = find_question(tmp_question); // 找到对应的持久对象
	*(*question_iter) = *tmp_question;  // 通过复制更新持久对象
	(*find_user(tmp_user))->new_question(*question_iter);  // 查找持久对象并将其更新其问题列表
	return true;
}