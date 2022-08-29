add_executable(main "main.cpp" "data_engine.h" "data_engine.cpp" "extern/app.pb.cc" "extern/app.grpc.pb.cc" "user.h" "question.h" "infrastructure.h" "infrastructure.cpp" "app.cpp" "app.h" "grpc.h" "grpc.cpp")


target_link_libraries(main ${CONAN_LIBS})

