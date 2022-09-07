#pragma once
#include <iostream>
#include "infrastructure.h"
#include <memory>
#include <utility>
using namespace std;

class Question {
	
private:
	string title;
	string content;
	string id;
	int category;
	bool answered=false;
	string answer;
public:
	explicit Question(string ti="", const string& co = "", string i = "", int ca = 0, bool _answered = false, string _answer = "") :title(std::move(ti)),content(to_utf8(co)), id(std::move(i)), category(ca), answered(_answered), answer(std::move(_answer)) {}
	[[nodiscard]] string get_title() const {
		return title;
	}
	[[nodiscard]] string get_id() const {
		return id;
	}
	[[nodiscard]] string get_content() const {
		return content;
	}
	[[nodiscard]] int get_category() const {
		return category;
	}
	[[nodiscard]] string get_answer() const {
		return answer;
	}
	[[nodiscard]] bool is_answered() const {
		return answered;
	}
};