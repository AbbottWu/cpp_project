cmake_minimum_required(VERSION 3.23)

enable_testing()
include(GoogleTest)

add_executable(basetest "base_test.cpp" "../src/data_engine.h"  "../src/data_engine.cpp" "../src/extern/app.pb.cc" "../src/user.h" "../src/question.h" "../src/infrastructure.h" "../src/infrastructure.cpp")

target_link_libraries(basetest ${CONAN_LIBS})
gtest_discover_tests(basetest)

#add_executable(localtest "local_test.cpp" "../src/app.cpp" "../src/app.h" "../src/user.h" "../src/question.h" "../src/data_engine.cpp" "../src/extern/app.pb.cc" "../src/infrastructure.cpp" "../src/extern/app.grpc.pb.cc" "../src/grpc.cpp")
#target_link_libraries(localtest ${CONAN_LIBS})
#gtest_discover_tests(localtest)

add_executable(engine_test "new_engine_test.cpp" "../src/app.cpp" "../src/app.h" "../src/user.h" "../src/question.h" "../src/data_engine.cpp" "../src/extern/app.pb.cc" "../src/infrastructure.cpp" "../src/extern/app.grpc.pb.cc" "../src/grpc.cpp")
target_link_libraries(engine_test ${CONAN_LIBS})
gtest_discover_tests(engine_test)
