#include <iostream>
#include <memory>
#include <vector>
#include <fstream>
#include "data_engine.h"
#include "extern/app.pb.h"

using namespace std;


ProtoEngine::ProtoEngine(const string &p) : DataEngine(p) {
    try {
        fstream input(path, ios::in | ios::binary);
        record.ParseFromIstream(&input);
        input.close();
    }
    catch (const std::exception &e) {
        cout << e.what();
    }
}

bool ProtoEngine::save_users(vector<shared_ptr<User>> users) {
    try {
        record.clear_users();
        for (auto &user: users) {
            auto tmp = record.add_users();
            tmp->set_name(user->get_name());
            tmp->set_token(user->get_token());
            tmp->set_is_answerer(user->get_isAnswer());
            auto questions = user->get_questions();
            for (auto &question: questions) {
                tmp->add_questionsid(question->get_id());
            }
        }
        return true;
    }
    catch (const std::exception &e) {
        cout << e.what();
    }
    return false;
}

bool ProtoEngine::save_questions(vector<shared_ptr<Question>> questions) {
    try {
        record.clear_questions();
        for (auto &question: questions) {
            auto tmp = record.add_questions();
            tmp->set_title(question->get_title());
            tmp->set_content(question->get_content());
            tmp->set_id(question->get_id());
            tmp->set_category(question->get_category());
            tmp->set_answered(question->is_answered());
            tmp->set_answer(question->get_answer());
        }
        return true;
    }
    catch (const std::exception &e) {
        cout << e.what();
    }
    return false;
}

vector<shared_ptr<User>> ProtoEngine::read_users(vector<shared_ptr<Question>> questions) {
    int size = record.users_size();
    vector<shared_ptr<User>> users(size);
    for (int i = 0; i < size; i++) {
        app::User one_user = record.users(i);
        int questions_size = one_user.questionsid_size();
        vector<shared_ptr<Question>> one_user_questions(questions_size);
        for (int j = 0; j < questions_size; j++) {
            one_user_questions[j] = *find_if(questions.begin(), questions.end(),
                                             [one_user, j](const shared_ptr<Question> &question) {
                                                 if (one_user.questionsid(j) == question->get_id()) {
                                                     return true;
                                                 }
                                                 return false;
                                             });
        }
        users[i] = std::make_shared<User>(one_user.name(), one_user.token(), one_user.is_answerer(),
                                          one_user_questions);
    }
    return users;
}

vector<shared_ptr<Question>> ProtoEngine::read_questions() {
    int size = record.questions_size();
    vector<shared_ptr<Question>> questions(size);
    for (int i = 0; i < size; i++) {
        app::Question j = record.questions(i);
        questions[i] = std::make_shared<Question>(j.title(), j.content(), j.id(), j.category(), j.answered(),
                                                  j.answer());
    }
    return questions;
}

bool ProtoEngine::shutdown() {
    google::protobuf::ShutdownProtobufLibrary();
    return true;
}

bool ProtoEngine::save() {
    try {
        fstream output(path, ios::out | ios::binary | ios::trunc);
        record.SerializeToOstream(&output);
        output.close();
    }
    catch (const std::exception &e) {
        cout << e.what();
        return false;
    }
    return true;
}

bool ProtoEngine::load() {
    try {
        fstream input(path, ios::in | ios::binary);
        record.ParseFromIstream(&input);
        input.close();
    }
    catch (const std::exception &e) {
        cout << e.what();
        return false;
    }
    return true;
}

bool ProtoEngine::clear() {
    try {
        record.clear_users();
        record.clear_questions();
    }
    catch (const std::exception &e) {
        cout << e.what();
        return false;
    }
    return true;
}