#include "systemc.h"
const int WIDTH = 10;
SC_MODULE(geleima){
    sc_in<sc_bv<WIDTH> > data;
    sc_out<sc_bv<WIDTH> > data_out;
    
    void chuli();
    SC_CTOR(geleima){
        SC_METHOD(chuli);
        sensitive << data;

    }
};

void geleima::chuli(){
    sc_bv<WIDTH> temp1; //temp data
    sc_bv<WIDTH> temp2; //out to data_out
    temp1 = data.read();
    temp2 = data;
    
    int number;
    int sign = 0;
    for(number=WIDTH;number>1;number--)
        temp2[number-2]=temp2[number-1]^temp1[number-2];
    data_out= temp2;

    cout<<"data_in="<<temp1<<", and "<<"data_out="<<temp2<<endl;
        

}