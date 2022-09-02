#pragma once
#include <iostream>
#include "infrastructure.h"
#include <memory>
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
	Question(string ti="", string co = "", string i = "", int ca = 0, bool _answered = false, string _answer = "") :title(ti),content(to_utf8(co)), id(i), category(ca), answered(_answered), answer(_answer) {}
	string get_title() const {
		return title;
	}
	string get_id() const {
		return id;
	}
	string get_content() const {
		return content;
	}
	int get_category() const {
		return category;
	}
	string get_answer() const {
		return answer;
	}
	bool is_answered() const {
		return answered;
	}
};