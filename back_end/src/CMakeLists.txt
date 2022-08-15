add_executable(main "main.cpp" "echo.pb.cc"  "main.h" "echo.grpc.pb.cc")


target_link_libraries(main ${CONAN_LIBS})

