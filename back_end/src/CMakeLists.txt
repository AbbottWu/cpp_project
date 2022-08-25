add_executable(main "main.cpp" "data_engine.h" "date_engine.cpp" "extern/app.pb.cc" "user.h" "question.h" "infrastructure.h" "infrastructure.cpp" "app.cpp" "app.h")


target_link_libraries(main ${CONAN_LIBS})

