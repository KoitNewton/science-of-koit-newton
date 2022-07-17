#include "test.h"
#include "monitor.h"
int sc_main(int argc, char* argv[]) {
    sc_signal_rv<4> miao;
    sc_signal<bool> time_1;

	test t1 ("say_hello_miao");
    t1.result(miao);
    t1.shijian(time_1);

    monitor m1 ("LetMeSee1See");
    m1.kanyikan(miao);
    m1.cnt(time_1); 
	
    sc_start(16,SC_NS);
	return (0);


}