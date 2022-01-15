#include <iostream>
#include <string>

using namespace std;

void swap(int& a, int& b) {

	int temp = a;
	a = b;
	b = temp;

}


class onnna {

public:
    void age1(int a){
		age = a;
	}

	int show(){
		return showage();
	}
private:
	int age;
	
	int showage() {
		return age / 2;
	};

};

int main() {

	int a = 1000;
	int b = 2000;

	swap(a, b);
	onnna nami;
	cout << "a=" << a << endl;
	cout << "b=" << b << endl;
	nami.age1(19) ;
	cout << nami.age1(19) << endl;

}