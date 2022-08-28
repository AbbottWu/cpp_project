#include <gtest/gtest.h>
#include <vector>
#include <utility>
#include "../src/app.h"
#include "../src/user.h"
#include "../src/question.h"
#include "../src/data_engine.h"

DataEngine* test_engine = new ProtoEngine("./bin");
auto test_user_questions1 = test_engine->read_questions();
auto test_user_questions2 = test_engine->read_questions();

bool compare_questions_byid(vector<Question*>one, vector<Question*>another) {
	std::set<string> id1;
	std::set<string> id2;
	for each (auto var in one)
	{
		id1.insert(var->get_id());
	}
	for each (auto var in another)
	{
		id2.insert(var->get_id());
	}
	return id1 == id2;
}

bool preTest() {
	Question* test_question1 = new Question("title", "content1", "asdfgh", 1, false, "");
	Question* test_question2 = new Question("title", "content2", "sdfghj", 2, true, "answer for 2");
	Question* test_question3 = new Question("title", "content3", "dfghjk", 3, false, "");
	Question* test_question4 = new Question("title", "content4", "fghjkl", 4, true, "answer for 4");
	test_user_questions1.push_back(test_question1);
	test_user_questions1.push_back(test_question3);
	test_user_questions2.push_back(test_question2);
	test_user_questions2.push_back(test_question4);
	User* test_user1 = new User("awu", "zxcv", false, test_user_questions1);
	User* test_user2 = new User("bwu", "xcvb", true, test_user_questions2);
	vector<Question*> pre_test_questions;
	vector<User*> pre_test_users;
	pre_test_questions.push_back(test_question1);
	pre_test_questions.push_back(test_question2);
	pre_test_questions.push_back(test_question3);
	pre_test_questions.push_back(test_question4);
	pre_test_users.push_back(test_user1);
	pre_test_users.push_back(test_user2);
	test_engine->save_questions(pre_test_questions);
	test_engine->save_users(pre_test_users);
	return true;
}
auto _ = preTest();
App& runtime = App::get_instance(test_engine);

TEST(AppLocalTest, LoginTest) {
	User* testUser1 = new User("awu", "zxcv", false);
	User* testUser5 = new User("bwu", "xcvb", true);
	User* testUser2 = new User("awu", "zxcv", true);
	User* testUser3 = new User("awu", "zxc", false);
	User* testUser4 = new User("bwu", "zxcv", true);
	EXPECT_TRUE(runtime.local_login(testUser1));
	EXPECT_TRUE(runtime.local_login(testUser5));
	EXPECT_FALSE(runtime.local_login(testUser2));
	EXPECT_FALSE(runtime.local_login(testUser3));
	EXPECT_FALSE(runtime.local_login(testUser4));
	delete testUser1;
	delete testUser2;
	delete testUser3;
	delete testUser4;
	delete testUser5;
}

TEST(AppLocalTest, SignUpTest) {
	User* testUser = new User("me", "token", false);
	EXPECT_FALSE(runtime.local_login(testUser));
	EXPECT_TRUE(runtime.local_register(testUser));
	delete testUser;
	testUser = new User("me", "token", false);
	EXPECT_TRUE(runtime.local_login(testUser));
	delete testUser;
}

TEST(AppLocalTest, ALLQuestionsTest) {
	auto answered = runtime.all_questions(true);
	auto not_answered = runtime.all_questions(false);
	EXPECT_TRUE(compare_questions_byid(not_answered,test_user_questions1));
	EXPECT_TRUE(compare_questions_byid(answered,test_user_questions2));
}

TEST(AppLocalTest, MyQuestionsTest) {
	User* test_user1 = new User("awu", "zxcv", false);
	User* test_user2 = new User("bwu", "xcvb", true);
	auto user1 = runtime.my_questions(test_user1);
	auto user2 = runtime.my_questions(test_user2);
	EXPECT_TRUE(compare_questions_byid(user1, test_user_questions1));
	EXPECT_TRUE(compare_questions_byid(user2, test_user_questions2));
	delete test_user1;
	delete test_user2;
}

TEST(AppLocalTest, AskTest) {
	User* test_user = new User("awu", "zxcv", false);
	Question* test_question = new Question("title", "myQuestion", "ijnmhk", 1, false, "");
	int before_ask = (*(runtime.find_user(test_user)))->get_questions().size();
	EXPECT_DEATH((*(runtime.find_question(test_question)))->get_content(), "");
	auto test_UQpair = make_pair(test_user, test_question);
	EXPECT_TRUE(runtime.ask_question(test_UQpair));
	EXPECT_EQ(before_ask + 1, (*(runtime.find_user(test_user)))->get_questions().size());
	delete test_question;
	test_question = new Question("", "", "ijnmhk");
	EXPECT_EQ((*(runtime.find_question(test_question)))->get_content(),"myQuestion");
	delete test_user;
	delete test_question;
}

TEST(AppLocalTest, AnswerTest) {
	User* test_user = new User("bwu", "xcvb", true);
	Question* test_question = new Question("", "", "dfghjk", 1, true, "someanswer");
	int before_ask = (*(runtime.find_user(test_user)))->get_questions().size();
	EXPECT_FALSE((*(runtime.find_question(test_question)))->is_answered());
	auto test_UQpair = make_pair(test_user, test_question);
	EXPECT_TRUE(runtime.answer_question(test_UQpair));
	EXPECT_EQ(before_ask + 1, (*(runtime.find_user(test_user)))->get_questions().size());
	delete test_question;
	test_question = new Question("", "", "dfghjk");
	EXPECT_EQ((*(runtime.find_question(test_question)))->get_answer(), "someanswer");
	EXPECT_TRUE((*(runtime.find_question(test_question)))->is_answered());
	delete test_user;
	delete test_question;
}