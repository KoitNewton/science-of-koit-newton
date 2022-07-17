#include "test.h"

int sc_main(int argc, char* argv[]) {
    sc_signal <bool> data;
	jiance d1 ("say_hello_miao");
    sc_clock clk("clk");
    d1.clk(clk);
    sc_bv<22> data_in = '0010110111001111110001';
    while(1){
        data = data_in[0];
        cout << "At time " << sc_time_stamp() <<" ,"<<"data="<<data;
        data_in >> 1;

    }
	sc_start(100,SC_NS);
	return 0;


}
