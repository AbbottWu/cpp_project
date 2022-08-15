enable_testing()

add_executable(test "text.cpp" )

target_link_libraries(test ${CONAN_LIBS})
include(GoogleTest)
gtest_discover_tests(test)
