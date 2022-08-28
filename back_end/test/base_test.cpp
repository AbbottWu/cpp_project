#include <gtest/gtest.h>
#include <vector>
#include "../src/user.h"
#include "../src/question.h"
#include "../src/data_engine.h"
//单元测试
//第一个是测试用例名，一组小测试的组合名；第二个是测试名
//用来保证每节的代码是ok的
TEST(UserTest, BasicTest) {
	// 空元素测试
	User user;
	EXPECT_EQ(user.get_name(), "");//EQ 等于
	EXPECT_EQ(user.get_token(), "");
	EXPECT_TRUE(user.get_isAnswer());
	EXPECT_TRUE(typeid(user.get_questions()) == typeid(vector<Question*>));
}

TEST(QuestionTest, BasicTest) {
	// 空元素测试
	Question question;
	EXPECT_EQ(question.get_content(), "");
	EXPECT_EQ(question.get_id(), "");
	EXPECT_EQ(question.get_category(), 0);
}

TEST(DataEngineTest, QuestionTest) {
	// 初始化并进行空测试
	ProtoEngine engine("./bin");
	auto tmp = engine.read_questions();
	EXPECT_EQ(tmp.size(), 0);

	// 单元素保存与读取测试
	tmp.push_back(new Question("title", "content", "id", 1));
	engine.save_questions(tmp);
	EXPECT_EQ(engine.read_questions().size(), 1);
	EXPECT_EQ((engine.read_questions()[0])->get_content(), "content");
	
	// 多元素保存与读取测试
	tmp.push_back(new Question("title", "内容", "编号", 2));
	tmp.push_back(new Question("title", "其他", "真编号", 3));
	engine.save_questions(tmp);
	EXPECT_EQ(engine.read_questions().size(), 3);
	EXPECT_EQ((engine.read_questions()[1])->get_content(), "内容");
}

TEST(DataEngineTest, OverallTest) {
	// 初始化并进行空测试
	DataEngine* engine =  new ProtoEngine("./bin");
	auto tmp_questions = engine->read_questions();
	auto tmp_users = engine->read_users(tmp_questions);
	EXPECT_EQ(tmp_users.size(), 0);
	
	// 单用户单问题保存与读取测试
	tmp_questions.push_back(new Question("title", "content", "id", 1));
	tmp_users.push_back(new User("awu", "token", true, tmp_questions));
	engine->save_users(tmp_users);
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_name(), "awu");
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_token(), "token");
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_isAnswer(), true);
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_questions()[0]->get_content(), "content");

	delete tmp_users[0];
	tmp_users.pop_back();

	// 单用户多问题保存与测试
	tmp_questions.push_back(new Question("title", "内容", "编号", 1));
	tmp_questions.push_back(new Question("title", "其他", "识别号", 1));
	tmp_users.push_back(new User("awu", "token", true, tmp_questions));
	engine->save_users(tmp_users);
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_name(), "awu");
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_token(), "token");
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_isAnswer(), true);
	EXPECT_EQ((engine->read_users(tmp_questions)[0])->get_questions().size(), 3);

	delete tmp_users[0];
	tmp_users.pop_back();

	// 多用户多问题保存与测试
	tmp_users.push_back(new User("awu", "token", true, tmp_questions));
	auto another_questions = engine->read_questions();
	another_questions.push_back(new Question("title", "另一个内容", "编1号", 2));
	another_questions.push_back(new Question("title", "其他一个", "识别号3", 2));
	tmp_users.push_back(new User("Describer", "myID", false, another_questions));
	another_questions.insert(another_questions.begin(), new Question("title", "另一个内容", "无他", 3));
	another_questions.insert(another_questions.end(), tmp_questions.begin(),tmp_questions.end());
	another_questions.push_back(new Question("title", "另一个内容", "编无他号", 3));
	engine->save_users(tmp_users);
	EXPECT_EQ((engine->read_users(another_questions)[0])->get_questions().size(), 3);
	EXPECT_EQ((engine->read_users(another_questions)[0])->get_questions()[0]->get_category(), 1);
	EXPECT_EQ((engine->read_users(another_questions)[0])->get_questions()[1]->get_category(), 1);
	EXPECT_EQ((engine->read_users(another_questions)[0])->get_questions()[2]->get_category(), 1);

	EXPECT_EQ((engine->read_users(another_questions)[1])->get_questions().size(), 2);
	EXPECT_EQ((engine->read_users(another_questions)[1])->get_questions()[0]->get_category(), 2);
	EXPECT_EQ((engine->read_users(another_questions)[1])->get_questions()[1]->get_category(), 2);

}
