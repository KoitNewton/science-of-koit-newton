#include "test.h"
#include "data_gen.h"
int sc_main(int argc, char* argv[]) {
    sc_signal <bool > data,q;
	jiance d1 ("say_hello_miao");
    miao m1 ("gen_data");
    sc_clock clk_1("clk_1",2,SC_NS);
    d1.clk(clk_1);
    d1.data_jiance(data);
    d1.q_jiance(q);
    m1.data_out(data);
  
    
    //while(clk_1==0)
        //data_in >> 1;
    
    //bool miao;
    //while(1){
        //data= data_in[0];
        //data_in >> 1;
        //data = miao;
       // if(q==1){
        //cout<<"At time "<<sc_time_stamp();
        //cout<<" data = "<<data<<" and q = "<<q<<endl;
        //}


    //}
	sc_start(60,SC_NS);
	return 0;


}
