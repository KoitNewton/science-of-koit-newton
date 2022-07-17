#include"systemc.h"


SC_MODULE(hello_world) {
	void say_hello();
	SC_CTOR(hello_world){
		SC_METHOD(say_hello);
	}
};

void hello_world::say_hello() {
	cout<<"Hello world!!!";
}
