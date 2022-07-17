#include "systemc.h"

SC_MODULE(jiance){
    sc_in <bool> clk,data;
    sc_out <bool> q;
    void check();

    SC_CTOR(jiance){
        SC_METHOD(check);
        sensitive_pos << clk;

    }


};

void jiance::check(){
    sc_bv<3> data_in;
    int ok = 0;
    data_in = (data_in[1],data_in[0],data.read());
    if(data_in=='111')
        ok = 1;
    else
        ok = 0;
    q = ok;
}

