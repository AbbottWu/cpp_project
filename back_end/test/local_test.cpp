#include <gtest/gtest.h>
#include <vector>
#include <utility>
#include "../src/app.h"

DataEngine *test_engine = new ProtoEngine("./bin");
auto test_user_questions1 = test_engine->read_questions();
auto test_user_questions2 = test_engine->read_questions();

bool compare_questions_by_id(const vector<shared_ptr<Question>>& one, const vector<shared_ptr<Question>>& another) {
    std::set<string> id1;
    std::set<string> id2;
    for (const auto& var: one) {
        id1.insert(var->get_id());
    }
    for (const auto& var: another) {
        id2.insert(var->get_id());
    }
    return id1 == id2;
}

bool preTest() {
    auto test_question1 = std::make_shared<Question>("title", "content1", "asdfgh", 1, false, "");
    auto test_question2 = std::make_shared<Question>("title", "content2", "sdfghj", 2, true, "answer for 2");
    auto test_question3 = std::make_shared<Question>("title", "content3", "dfghjk", 3, false, "");
    auto test_question4 = std::make_shared<Question>("title", "content4", "fghjkl", 4, true, "answer for 4");
    test_user_questions1.push_back(test_question1);
    test_user_questions1.push_back(test_question3);
    test_user_questions2.push_back(test_question2);
    test_user_questions2.push_back(test_question4);
    auto test_user1 = std::make_shared<User>("awu", "zxcv", false, test_user_questions1);
    auto test_user2 = std::make_shared<User>("bwu", "xcvb", true, test_user_questions2);
    vector<shared_ptr<Question>> pre_test_questions;
    vector<shared_ptr<User>> pre_test_users;
    pre_test_questions.push_back(test_question1);
    pre_test_questions.push_back(test_question2);
    pre_test_questions.push_back(test_question3);
    pre_test_questions.push_back(test_question4);
    pre_test_users.push_back(test_user1);
    pre_test_users.push_back(test_user2);
    test_engine->write_questions();
    test_engine->write_users();
    return true;
}

auto pre_set = preTest();
App &runtime = App::get_instance(test_engine);

TEST(AppLocalTest, LoginTest) {
    auto testUser1 = std::make_shared<User>("awu", "zxcv", false);
    auto testUser5 = std::make_shared<User>("bwu", "xcvb", true);
    auto testUser2 = std::make_shared<User>("awu", "zxcv", true);
    auto testUser3 = std::make_shared<User>("awu", "zxc", false);
    auto testUser4 = std::make_shared<User>("bwu", "zxcv", true);
    EXPECT_TRUE(runtime.local_login(testUser1));
    EXPECT_TRUE(runtime.local_login(testUser5));
    EXPECT_FALSE(runtime.local_login(testUser2));
    EXPECT_FALSE(runtime.local_login(testUser3));
    EXPECT_FALSE(runtime.local_login(testUser4));
}

TEST(AppLocalTest, SignUpTest) {
    auto testUser = std::make_shared<User>("me", "token", false);
    EXPECT_FALSE(runtime.local_login(testUser));
    EXPECT_TRUE(runtime.local_register(testUser));
    testUser = std::make_shared<User>("me", "token", false);
    EXPECT_TRUE(runtime.local_login(testUser));
}

TEST(AppLocalTest, ALLQuestionsTest) {
    auto answered = runtime.all_questions(true);
    auto not_answered = runtime.all_questions(false);
    EXPECT_TRUE(compare_questions_by_id(not_answered, test_user_questions1));
    EXPECT_TRUE(compare_questions_by_id(answered, test_user_questions2));
}

TEST(AppLocalTest, MyQuestionsTest) {
    auto test_user1 = std::make_shared<User>("awu", "zxcv", false);
    auto test_user2 = std::make_shared<User>("bwu", "xcvb", true);
    auto user1 = runtime.my_questions(test_user1);
    auto user2 = runtime.my_questions(test_user2);
    EXPECT_TRUE(compare_questions_by_id(user1, test_user_questions1));
    EXPECT_TRUE(compare_questions_by_id(user2, test_user_questions2));
}

TEST(AppLocalTest, AskTest) {
    auto test_user = std::make_shared<User>("awu", "zxcv", false);
    auto test_question = std::make_shared<Question>("title", "myQuestion", "ijnmhk", 1, false, "");
    int before_ask = (*(runtime.find_user(test_user)))->get_questions().size();
    EXPECT_DEATH((*(runtime.find_question(test_question)))->get_content(), "");
    auto test_UQpair = make_pair(test_user, test_question);
    EXPECT_TRUE(runtime.ask_question(test_UQpair));
    EXPECT_EQ(before_ask + 1, (*(runtime.find_user(test_user)))->get_questions().size());
    test_question = std::make_shared<Question>("", "", "ijnmhk");
    EXPECT_EQ((*(runtime.find_question(test_question)))->get_content(), "myQuestion");
}

TEST(AppLocalTest, AnswerTest) {
    auto test_user = std::make_shared<User>("bwu", "xcvb", true);
    auto test_question = std::make_shared<Question>("", "", "dfghjk", 1, true, "someanswer");
    int before_ask = (*(runtime.find_user(test_user)))->get_questions().size();
    EXPECT_FALSE((*(runtime.find_question(test_question)))->is_answered());
    auto test_UQpair = make_pair(test_user, test_question);
    EXPECT_TRUE(runtime.answer_question(test_UQpair));
    EXPECT_EQ(before_ask + 1, (*(runtime.find_user(test_user)))->get_questions().size());
    test_question = std::make_shared<Question>("", "", "dfghjk");
    EXPECT_EQ((*(runtime.find_question(test_question)))->get_answer(), "someanswer");
    EXPECT_TRUE((*(runtime.find_question(test_question)))->is_answered());
}