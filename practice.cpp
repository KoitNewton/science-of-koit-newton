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

	int a = 19;
	int b = 2000;

	swap(a, b);
	onnna nami;
	nami.age1(a);
	cout << "a=" << nami.show() << endl;
	cout << "b=" << b << endl;
	


}
