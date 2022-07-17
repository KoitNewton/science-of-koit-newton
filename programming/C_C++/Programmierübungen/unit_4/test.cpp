#include "test.h"

int sc_main(int argc, char* argv[]) {
    sc_signal <sc_bv<WIDTH> > miao;
    sc_signal <sc_bv<WIDTH> > miao1;
    miao = "1011001110"; 
	geleima d1 ("say_hello_miao");
    d1.data(miao);
    d1.data_out(miao1);

	sc_start(100,SC_NS);

	return 0;


}
