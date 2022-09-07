#include <csignal>
#include <thread>
#include <iostream>
#include "data_engine.h"
#include "grpc.h"
#include "app.h"
// #include <Windows.h>

using namespace std;

bool shutdown_required = false;

void signalHandler(int signum) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("Interrupt signal {} received", signum);
    // 清理并关闭
    // 终止程序
    runtime.logger->info("Server is shutting ...");
    shutdown_required = true;
}

void thread_check_shutdown() {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("watch thread is on");
    while (!shutdown_required){
        sleep(2);
    }
    runtime.server->Shutdown();
}

int main() {
    DataEngine *runtime_engine = new ProtoEngine("./try.bin");
    App &runtime = App::get_instance(runtime_engine);
    std::thread t(thread_check_shutdown);
    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);
    runtime.RunServer();
    runtime.logger->info("Server has already shut");
    t.join();
    return 0;
}