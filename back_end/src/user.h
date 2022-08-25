#pragma once
#include<iostream>
#include<vector>
#include "question.h"
using namespace std;

class User {
private:
	string name;  // 用户昵称
	string token;  // 用户的token（密码号）
	bool is_answer; // 用户类型（指定是回答者'a'还是提问者'q'）
	vector<Question*> questions;
public:
	User() {}
	User(string n, string t, bool u, vector<Question*> q) :name(to_utf8(n)), token(to_utf8(t)), is_answer(u), questions(q) {}
	string get_name() const { return name; }
	string get_token() const { return token; }
	bool get_isAnswer() const { return is_answer; }
	auto get_questions() const { return questions; }
};