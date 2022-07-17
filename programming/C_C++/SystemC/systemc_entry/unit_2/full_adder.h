#include "half_adder.h"

SC_MODULE(full_adder) {
	sc_in<bool>  a,b,carry_in;
	sc_out<bool> sum,carry_out;
	
	sc_signal<bool> c1,s1,c2;
	
	void prc_or();
	half_adder *ha1_ptr, *ha2_ptr;
	
	SC_CTOR(full_adder) {
		ha1_ptr = new half_adder("ha1");
		ha1_ptr->a(a);
		ha1_ptr->b(b);
		ha1_ptr->sum(s1);
		ha1_ptr->carry(c1);
		
		ha2_ptr = new half_adder("ha2");
		(*ha2_ptr)(s1,carry_in,sum,c2);	
	
		SC_METHOD(prc_or);
		sensitive <<c1<<c2;
	
	}
	
	~ full_adder() {
	delete ha1_ptr;
	delete ha2_ptr;
	}
};
