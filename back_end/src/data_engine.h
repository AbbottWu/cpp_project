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
	virtual bool save_users(vector<User*>) = 0;
	virtual bool save_questions(vector<Question*>) = 0;
	virtual vector<User*> read_users(vector<Question*>) = 0;
	virtual vector<Question*> read_questions() = 0;
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
	bool save_users(vector<User*>);
	bool save_questions(vector<Question*>);
	vector<User*> read_users(vector<Question*>);
	vector<Question*> read_questions();
	bool clear();
	bool save();
	bool load();
	bool shutdown();
};