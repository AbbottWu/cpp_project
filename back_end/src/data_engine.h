#pragma once
#include <iostream>
#include <vector>
#include "question.h"
#include "user.h"
#include "infrastructure.h"
#include "extern/app.pb.h"
using namespace std;

class User;
class Question;

class DataEngine {
protected:
	string path;
    vector<shared_ptr<User>> users;
    vector<shared_ptr<Question>> questions;
public:
	explicit DataEngine(const string& p) :path(to_utf8(p)) {}
	virtual bool write_users() = 0;
	virtual bool write_questions() = 0;
	virtual bool read_users() = 0;
	virtual bool read_questions() = 0;
    virtual bool local_register(const shared_ptr<User>&) = 0;
    virtual bool local_login(const shared_ptr<User>&) = 0;
    virtual bool ask_question(const pair<shared_ptr<User>, shared_ptr<Question>>&) = 0;
    virtual bool answer_question(const pair<shared_ptr<User>, shared_ptr<Question>>&) = 0;

    virtual vector<shared_ptr<Question>> all_questions(bool) = 0;
    virtual vector<shared_ptr<Question>> my_questions(const shared_ptr<User>&) = 0;
    virtual vector<shared_ptr<User>>::iterator find_user(const shared_ptr<User>&) = 0;
    virtual vector<shared_ptr<Question>>::iterator find_question(const shared_ptr<Question>&) = 0;
    virtual bool save() = 0;
    [[maybe_unused]] virtual bool shutdown() = 0;
	[[maybe_unused]] virtual bool load() = 0;
    [[maybe_unused]] virtual bool clear() = 0;
    [[maybe_unused]] virtual bool activate() = 0;
};

class ProtoEngine :public DataEngine {
private:
	app::Record record;
public:
	explicit ProtoEngine(const string& p): DataEngine(p){}
	bool write_users() override;
	bool write_questions() override;
	bool read_users() override;
	bool read_questions() override;
	bool clear() override;
	bool save() override;
	bool load() override;
	bool shutdown() override;
    bool activate() override;
    bool local_register(const shared_ptr<User> &) override;
    bool local_login(const shared_ptr<User> &) override;
    bool ask_question(const pair<shared_ptr<User>, shared_ptr<Question>> &) override;
    bool answer_question(const pair<shared_ptr<User>, shared_ptr<Question>> &) override;
    vector<shared_ptr<Question>> all_questions(bool) override;
    vector<shared_ptr<Question>> my_questions(const shared_ptr<User> &) override;
    vector<shared_ptr<User>>::iterator find_user(const shared_ptr<User> &) override;
    vector<shared_ptr<Question>>::iterator find_question(const shared_ptr<Question> &) override;
};


class ORMEngine :public DataEngine {
private:
    app::Record record;
public:
    explicit ORMEngine(const string& p);
    bool write_users() override;
    bool write_questions() override;
    bool read_users() override;
    bool read_questions() override;
    bool clear() override;
    bool save() override;
    bool load() override;
    bool shutdown() override;
};