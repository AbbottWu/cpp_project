#include <iostream>
#include <memory>
#include <vector>
#include <fstream>
#include "data_engine.h"
#include "extern/app.pb.h"
#include "sqlite_orm/sqlite_orm.h"

using namespace std;
using namespace sqlite_orm;

bool ProtoEngine::write_users() {
    try {
        record.clear_users();
        for (auto &user: users) {
            auto tmp = record.add_users();
            tmp->set_name(user->get_name());
            tmp->set_token(user->get_token());
            tmp->set_is_answerer(user->get_isAnswer());
            auto user_questions = user->get_questions();
            for (auto &question: user_questions) {
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

bool ProtoEngine::write_questions() {
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

bool ProtoEngine::read_users() {
    try {
        int size = record.users_size();
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
            users.push_back(std::make_shared<User>(one_user.name(), one_user.token(), one_user.is_answerer(),
                                                   one_user_questions));
        }
        return true;
    } catch (const std::exception &e) {
        cout << e.what();
    }
    return false;
}

bool ProtoEngine::read_questions() {
    try {
        int size = record.questions_size();
        for (int i = 0; i < size; i++) {
            app::Question j = record.questions(i);
            questions.push_back(std::make_shared<Question>(j.title(), j.content(), j.id(), j.category(), j.answered(),
                                                           j.answer()));
        }
        return true;
    } catch (const std::exception &e) {
        cout << e.what();
    }
    return false;
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

bool ProtoEngine::activate() {
    load();
    read_questions();
    read_users();
    return false;
}

bool ProtoEngine::local_register(const shared_ptr<User> & tmp_user) {
    users.push_back(std::make_shared<User>(*tmp_user)); // 通过复制构造函数建立持久对象并存入列表
    return true;
}

bool ProtoEngine::local_login(const shared_ptr<User> & tmp_user) {
    auto result = find_user(tmp_user);
    if (result == users.end()) {
        return false;
    }
    return true;
}

bool ProtoEngine::ask_question(const pair<shared_ptr<User>, shared_ptr<Question>> & UQpair) {
    auto tmp_user = UQpair.first;
    auto persist_question = UQpair.second; // 通过拷贝构造函数建立持久化对象
    questions.push_back(persist_question);  // 存储持久化对象
    auto user_iter = find_user(tmp_user);  // 通过临时对象寻找持久对象
    (*user_iter)->new_question(persist_question);  // 更新持久对象
    return true;
}

bool ProtoEngine::answer_question(const pair<shared_ptr<User>, shared_ptr<Question>> & UQpair) {
    auto tmp_user = UQpair.first;
    auto tmp_question = UQpair.second;
    auto question_iter = find_question(tmp_question); // 找到对应的持久对象
    *(*question_iter) = *tmp_question;  // 通过复制更新持久对象
    (*find_user(tmp_user))->new_question(*question_iter);  // 查找持久对象并将其更新其问题列表
    return true;
}

vector<shared_ptr<Question>> ProtoEngine::all_questions(bool answered) {
    vector<shared_ptr<Question>> tmp;
    copy_if(questions.begin(), questions.end(), back_inserter(tmp),
            [answered](const shared_ptr<Question>& per_question) {
                if ((per_question->is_answered()) == answered) {
                    return true;
                }
                return false;
            });
    return tmp;
}

vector<shared_ptr<Question>> ProtoEngine::my_questions(const shared_ptr<User> & tmp_user) {
    auto result = find_user(tmp_user);
    return (*result)->get_questions();
}

vector<shared_ptr<User>>::iterator ProtoEngine::find_user(const shared_ptr<User> & tmp_user) {
    auto result = find_if(users.begin(), users.end(),
                          [tmp_user](const shared_ptr<User> &per_user) {
                              if ((tmp_user->get_name() == per_user->get_name()) &&
                                  (tmp_user->get_token() == per_user->get_token()) &&
                                  (tmp_user->get_isAnswer() == per_user->get_isAnswer())) {
                                  return true;
                              }
                              return false;
                          });
    return result;

}

vector<shared_ptr<Question>>::iterator ProtoEngine::find_question(const shared_ptr<Question> & tmp_question) {
    auto result = find_if(questions.begin(), questions.end(), [tmp_question](const shared_ptr<Question>&question) {
        if (tmp_question->get_id() == question->get_id()) {
            return true;
        }
        return false;
    });
    return result;

}

ORMEngine::ORMEngine(const string &p) : DataEngine(p) {
    auto user_table = make_table("users",
                                 make_column("token", &User::token, primary_key()),
                                 make_column("name", &User::name),
                                 make_column("is_answerer", &User::is_answer),
                                 make_column("questions", &User::questions));
    auto question_table = make_table("questions",
                                     make_column("id", &Question::id, primary_key()),
                                     make_column("title", &Question::title),
                                     make_column("content", &Question::content),
                                     make_column("category", &Question::category),
                                     make_column("answered", &Question::answered),
                                     make_column("answer", &Question::answer));
    make_storage(p, user_table, question_table);

}

bool ORMEngine::read_users() {
    return true;
}

bool ORMEngine::shutdown() {
    return false;
}

bool ORMEngine::save() {
    return false;
}

bool ORMEngine::load() {
    return false;
}

bool ORMEngine::clear() {
    return false;
}

bool ORMEngine::read_questions() {
    return true;
}

bool ORMEngine::write_questions() {
    return false;
}

bool ORMEngine::write_users() {
    return false;
}
