#include "systemc.h"

SC_MODULE(jiance){
    sc_in <bool> clk,data_jiance;
    sc_out <bool> q_jiance;
    void check();
    void zhanshi();
    sc_signal <bool> first,second,third;

    SC_CTOR(jiance){
        SC_METHOD(check);
        sensitive_pos << clk;
        SC_METHOD(zhanshi);
        sensitive<<first<<second<<third;
    }


};

void jiance::check(){
    first = data_jiance;
    second = first;
    third = second;
    cout<<"At time "<<sc_time_stamp();
    cout<<" data ="<<data_jiance<<" and q = "<<q_jiance<<endl;
}

void jiance::zhanshi(){
    q_jiance = first&second&third;
   // cout<<"At time "<<sc_time_stamp();
    //cout<<" data ="<<data_jiance<<" and q = "<<q_jiance<<endl;

}
