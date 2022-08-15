project(OneProject)
cmake_minimum_required(VERSION 2.8.12)
set(CMAKE_BINARY_DIR ./build)
message(${CMAKE_BINARY_DIR})
include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

add_subdirectory(protoc)
include_directories(${PROTO_GEN_CXX_INCLUDE_DIRS})


add_subdirectory(src)

add_subdirectory(test)
