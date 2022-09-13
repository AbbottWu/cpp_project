#include <gtest/gtest.h>
#include <memory>
#include <vector>
#include "../src/user.h"
#include "../src/data_engine.h"
//单元测试
//第一个是测试用例名，一组小测试的组合名；第二个是测试名
//用来保证每节的代码是ok的
class User;
class Question;

TEST(UserTest, BasicTest) {
	// 空元素测试
	User user;
	EXPECT_EQ(user.get_name(), "");//EQ 等于
	EXPECT_EQ(user.get_token(), "");
	EXPECT_TRUE(user.get_isAnswer());
	EXPECT_TRUE(typeid(user.get_questions()) == typeid(vector<shared_ptr<Question>>));
}

TEST(QuestionTest, BasicTest) {
	// 空元素测试
	Question question;
	EXPECT_EQ(question.get_content(), "");
	EXPECT_EQ(question.get_id(), "");
	EXPECT_EQ(question.get_category(), 0);
}
