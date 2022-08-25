#include <iostream>
#include "app.h"

app::app() {

}

app::~app() {

}

app& app::get_instance() {
	static app instance;
	return instance;
}