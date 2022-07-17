#include "systemc.h"
SC_MODULE(half_adder){
	sc_in<bool> a,b;
	sc_out<bool> sum,carry;
	
	void prc_half_adder();
	
	SC_CTOR(half_adder) {
		SC_METHOD(prc_half_adder);	
		sensitive<<a<<b;
	}
};
