enable_testing()

add_executable(test "test.cpp " "../src/data_engine.h"  "../src/date_engine.cpp" "../src/extern/app.pb.cc" "../src/user.h" "../src/question.h" "../src/infrastructure.h" "../src/infrastructure.cpp" )

target_link_libraries(test ${CONAN_LIBS})
include(GoogleTest)
gtest_discover_tests(test)
