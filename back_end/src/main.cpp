#include <csignal>
#include <thread>
#include <iostream>
#include "data_engine.h"
#include "grpc.h"
#include "app.h"
#include "clipp.h"

using namespace std;
using namespace clipp;

bool shutdown_required = false;

void signalHandler(int signum) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("Interrupt signal {} received", signum);
    // 清理并关闭
    // 终止程序
    runtime.logger->info("Server is shutting ...");
    runtime.SaveData();
    shutdown_required = true;
}

void thread_check_shutdown(int beat_time) {
    App &runtime = App::get_instance(nullptr);
    runtime.logger->info("Watch thread is on");
    while (!shutdown_required) {
        std::this_thread::sleep_for(std::chrono::seconds(beat_time));
    }
    runtime.server->Shutdown();
}

int main(int argc, char **argv) {
    string data_file = "./try.bin";
    string address = "127.0.0.1";
    string port = "12345";
    string log_file = "./my_log.txt";
    int beat_time = 5;
    auto cli = (
            option("-d", "--data") & value("Data", data_file).doc("Where to store the data file"),
                    option("-a", "--address") & value("Address", address).doc("The server listen address"),
                    option("-p", "--port") & value("Port", port).doc("The server listen port"),
                    option("--beat-time") & value("Gap", beat_time).doc("The time between two server status check"),
                    option("--log-file") & value("Log", log_file).doc("Where to store the log file.")
    );
    if (!parse(argc, argv, cli)) {
        cout << make_man_page(cli, argv[0]);
    } else {
        DataEngine *runtime_engine = new ProtoEngine(data_file);
        App &runtime = App::get_instance(runtime_engine, log_file);
        std::thread t([beat_time] { return thread_check_shutdown(beat_time); });
        signal(SIGINT, signalHandler);
        signal(SIGTERM, signalHandler);
        runtime.RunServer(address, port);
        runtime.logger->info("Server has already shut");
        t.join();

    }

    return 0;
}