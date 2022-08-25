#include <iostream>
#include <vector>
#include <fstream>
#include "data_engine.h"
#include "extern/app.pb.h"

using namespace std;

class map_id {
private:
	string id;
public:
	map_id(string s) :id(s) {}
	inline bool operator()(const Question* q) {
		if (q->get_id() == id) {
			return true;
		}
		return false;
	}
};

ProtoEngine::ProtoEngine(string p) :DataEngine(p) {
	load();
}

bool ProtoEngine::save_users(vector<User*> users) {
	try
	{
		record.clear_users();
		for (auto i = users.begin(); i != users.end(); i++)
		{
			auto tmp = record.add_users();
			tmp->set_name((*i)->get_name());
			tmp->set_token((*i)->get_token());
			tmp->set_is_answerer((*i)->get_isAnswer());
			auto questions = (*i)->get_questions();
			for (auto j = questions.begin(); j != questions.end(); j++)
			{
				tmp->add_questionsid((*j)->get_id());
			}
		}
		return true;
	}
	catch (const std::exception& e)
	{
		cout << e.what();
	}
	return false;
}

bool ProtoEngine::save_questions(vector<Question*> questions) {
	try
	{
		record.clear_questions();
		for (auto i = questions.begin(); i != questions.end(); i++)
		{
			auto tmp = record.add_questions();
			tmp->set_content((*i)->get_content());
			tmp->set_id((*i)->get_id());
			tmp->set_category((*i)->get_category());
		}
		return true;
	}
	catch (const std::exception& e)
	{
		cout << e.what();
	}
	return false;
}
vector<User*> ProtoEngine::read_users(vector<Question*> questions) {
	int size = record.users_size();
	vector<User*> users(size);
	for (int i = 0; i < size; i++) {
		app::User one_user = record.users(i);
		int questions_size = one_user.questionsid_size();
		vector<Question*> one_user_questions(questions_size);
		for (int j = 0; j < questions_size; j++)
		{
			one_user_questions[j] = *find_if(questions.begin(), questions.end(), map_id(one_user.questionsid(j)));
		}
		users[i] = new User(one_user.name(), one_user.token(), one_user.is_answerer(), one_user_questions);
	}
	return users;
}

vector<Question*> ProtoEngine::read_questions() {
	int size = record.questions_size();
	vector<Question*> questions(size);
	for (int i = 0; i < size; i++)
	{
		app::Question j = record.questions(i);
		questions[i] = new Question(j.content(), j.id(), j.category());
	}
	return questions;
}
bool ProtoEngine::shutdown() {
	google::protobuf::ShutdownProtobufLibrary();
	return true;
}

bool ProtoEngine::save() {
	try
	{
		fstream output(path, ios::out | ios::binary | ios::trunc);
		record.SerializeToOstream(&output);
		output.close();
	}
	catch (const std::exception& e)
	{
		cout << e.what();
		return false;
	}
	return true;
}

bool ProtoEngine::load() {
	try
	{
		fstream input(path, ios::in | ios::binary);
		record.ParseFromIstream(&input);
		input.close();
	}
	catch (const std::exception& e)
	{
		cout << e.what();
		return false;
	}
	return true;
}

bool ProtoEngine::clear() {
	try
	{
		record.clear_users();
		record.clear_questions();
	}
	catch (const std::exception& e)
	{
		cout << e.what();
		return false;
	}
	return true;
}