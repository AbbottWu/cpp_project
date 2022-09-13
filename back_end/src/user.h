#pragma once
#include<iostream>
#include <utility>
#include <vector>
#include "data_engine.h"

using namespace std;

class Question;

class User {
private:
    friend class ORMEngine;
    string name;  // 用户昵称
	string token;  // 用户的token（密码号）
	bool is_answer; // 用户类型（指定是回答者'a'还是提问者'q'）
	vector<shared_ptr<Question>> questions;
public:
	User() {
		name = "";
		token = "";
		is_answer = true;
	}
	User(string n, string t, bool is_an):name(std::move(n)),token(std::move(t)),is_answer(is_an) {}
	User(const string& n, const string& t, bool u, vector<shared_ptr<Question>> q) :name(to_utf8(n)), token(to_utf8(t)), is_answer(u), questions(std::move(q)) {}
	[[nodiscard]] string get_name() const { return name; }
	[[nodiscard]] string get_token() const { return token; }
	[[nodiscard]] bool get_isAnswer() const { return is_answer; }
	[[nodiscard]] auto get_questions() const { return questions; }
	void new_question(const shared_ptr<Question>& question) {
		questions.push_back(question);
	}
};