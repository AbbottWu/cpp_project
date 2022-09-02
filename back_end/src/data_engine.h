#pragma once
#include <iostream>
#include <vector>
#include "question.h"
#include "user.h"
#include "infrastructure.h"
#include "extern/app.pb.h"
using namespace std;

class DataEngine {
protected:
	string path;

public:
	DataEngine(string p) :path(to_utf8(p)) {}
	virtual bool save_users(vector<shared_ptr<User>>) = 0;
	virtual bool save_questions(vector<shared_ptr<Question>>) = 0;
	virtual vector<shared_ptr<User>> read_users(vector<shared_ptr<Question>>) = 0;
	virtual vector<shared_ptr<Question>> read_questions() = 0;
	virtual bool shutdown() = 0;
	virtual bool save() = 0;
	virtual bool load() = 0;
	virtual bool clear() = 0;
};

class ProtoEngine :public DataEngine {
private:
	app::Record record;
public:
	ProtoEngine(string p);
	bool save_users(vector<shared_ptr<User>>);
	bool save_questions(vector<shared_ptr<Question>>);
	vector<shared_ptr<User>> read_users(vector<shared_ptr<Question>>);
	vector<shared_ptr<Question>> read_questions();
	bool clear();
	bool save();
	bool load();
	bool shutdown();
};