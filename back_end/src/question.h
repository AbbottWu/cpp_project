#pragma once
#include <iostream>
#include "infrastructure.h"
using namespace std;

class Question {
	
private:
	string content;
	string id;
	int category;
public:
	Question(string co="", string i = "", int ca = 0) :content(to_utf8(co)), id(i), category(ca) {}
	string get_id() const {
		return id;
	}
	string get_content() const {
		return content;
	}
	int get_category() const {
		return category;
	}
};