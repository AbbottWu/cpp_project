#include<iostream>
#include "data_engine.h"
#include "grpc.h"
#include "app.h"
using namespace std;


int main() {
    DataEngine* runtime_engine = new ProtoEngine("./try.bin");
    App &runtime = App::get_instance(runtime_engine);
    RunServers();
	cout << "hello" << endl;
	return 0;
}