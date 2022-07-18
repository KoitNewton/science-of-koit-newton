#include "systemc.h"

SC_MODULE(miao){
    sc_out <bool> data_out;

    void data_miao();

    SC_CTOR(miao){
        SC_THREAD(data_miao);

    }


};
void miao::data_miao(){
    sc_uint<22> data_in = 0b0010110111001111110001;
    int m = 21;
    while(1) {
        
        data_out = data_in[m];
        wait(2,SC_NS);
        m--;

    }

}