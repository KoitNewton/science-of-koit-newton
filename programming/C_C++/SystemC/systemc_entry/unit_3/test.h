#include "systemc.h"
SC_MODULE(test){


    sc_out_rv<4> result;
    sc_out<bool > shijian;
   
    void qudong_1();
    void qudong_2();
    void time();

    SC_CTOR(test){
        SC_THREAD(qudong_1);
        SC_THREAD(qudong_2);
        SC_THREAD(time);
    }


};




void test::qudong_1(){
    result = 0;
    wait(5,SC_NS);
    result = 5;
    wait(5,SC_NS);
    result = 10;
    wait(5,SC_NS);
    result = 12;
    
};


void test::qudong_2(){
    result = 6;
    wait(3,SC_NS);
    result = 4;
    wait(5,SC_NS);
    result = 8;
    wait(4,SC_NS);
    result = 0;
    
};

void test::time(){
    sc_int<2> shijie;
    shijie = 0;
    while(1){
        shijian=shijie[0];
        wait(1,SC_NS);
        shijie++;
        
    }


}