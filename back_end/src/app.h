#pragma once
#include <iostream>

using namespace std;
class app {
public:
	static app &get_instance();
private:
	app();
	~app();
	app(const app&){}
	const app& operator=(const app&){}
};