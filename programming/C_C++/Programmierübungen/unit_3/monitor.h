 #include "systemc.h"
 SC_MODULE(monitor){
    sc_in_rv<4> kanyikan;
    sc_in<bool> cnt;
    void print_result();
    SC_CTOR(monitor){
        SC_METHOD(print_result);
        sensitive << cnt;
    }



 };
 
 
 
 void monitor::print_result(){
    cout<<"At time "<<sc_time_stamp()<<"::";
    cout<<"result="<<kanyikan<<endl;
 }  

