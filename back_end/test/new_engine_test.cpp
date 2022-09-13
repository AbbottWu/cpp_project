#include <gtest/gtest.h>
#include <vector>
#include <utility>
#include "../src/app.h"

DataEngine *test_engine = new ProtoEngine("./bin");

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
