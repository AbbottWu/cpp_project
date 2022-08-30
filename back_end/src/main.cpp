#include<iostream>
#include "data_engine.h"
#include "grpc.h"
#include "app.h"
#include <csignal>
using namespace std;

void signalHandler( int signum )
{
    App &runtime = App::get_instance(nullptr);

    cout << "Interrupt signal (" << signum << ") received.\n";
    // 清理并关闭
    // 终止程序
    runtime.logger->info("程序结束");
    exit(signum);
}


int main() {
    DataEngine* runtime_engine = new ProtoEngine("./try.bin");
    App &runtime = App::get_instance(runtime_engine);
    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);
    prepareServer();
	return 0;
}