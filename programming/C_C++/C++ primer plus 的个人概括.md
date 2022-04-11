# C++ primer plus 的个人概括

## 第十章 对象和类

### 10.1 抽象和类

1，**抽象** 把某个数据类型抽象化，提取出一些参数、功能（也就是函数）这些特征来表示这个数据类型

2，**封装和数据影藏** 把数据封装，留出权限不同的接口

3，**多态**

4，**继承**

5，**代码的可重用性**

举例子：类似下面的代码，把股票的交易抽象为一个类，也是一类行为嘛

包括股票的性质：股票名称、持有数目、单价、总价等；

行为上包括：得到股票信息、买、卖、刷新价格、显示信息等；

```c++
#include<iostream>
#include<string>
using namespace std;

class stock {
private:                 //这种private接口在class不可调用
	string company;  //抽象出的数据类型
	long shares;
	double share_val;
	double total_val;
	void set_tot() { total_val = shares * share_val; } //里面的一个函数

public:          //可以把private的数据通过函数形式连接到public端口上去
	void acquire(const string& co, long n, double pr);  //这些函数在此定义了，可以根据需求设计内部逻辑
	void buy(long num, double price);
	void sell(long num, double price);
	void update(double price);
	void show();

};

int main() {                   //类似下面的调用方式
	string Qianqian="Intel";
	long number = 1085;
	string& Q = Qianqian;
	double price = 685.66;
	stock boe;
	boe.acquire(Q,number,price);
    
    return 0；
}



```

如果想要修改private里面的某些参量之类，可以在public里面定义一个操作private里面数据的函数。

### **10.2 类的构造函数和解析函数**

类的构造函数没有返回值，在调用类的时候会自动运行它，且它的参量不能和类的内部的参量名称一致；

我们可以构建如下的构造函数来初始化class book中的变量：

```c++
class book
{
public:
    book(){}
    book(char* a, double p);
    void setprice(double a);
    double getprice();
    void settitle(char* a);
    char * gettitle();
    void display();
private:
    double price;
    char * title;
};
book::book(char *a, double p):title(a),price(p){}  //把a初始化给title p传递给price
```

用构造函数创建对象后，程序负责跟踪该对象，直到其过期为止。对象过期时，程序将自动调用一个特殊的成员函数，该函数的名称令人生畏——析构函数。析构函数完成清理工作，因此实际上很有用。例如，如果构造函数使用new来分配内存，则析构函数将使用delete来释放这些内存。

析构函数前面会有一个~，类似~book(){}; ~stock(){};  

不用自己声明其实也是有默认值的，编译器自己创建的函数。

### 10.3 this指针

**this指针指向用来调用成员函数的对象（this被作为隐藏参数传递给方法）。**

不用特地去声明这个指针，它隐含在每一个非静态成员函数内的一种指针，可以直接使用。

用途：

1. 形参和成员变量重名时，用this区分
2. 类的非静态成员函数中返回对象本身时，可以使用return *this

这是一个减轻代码中名称冲突的有效方法，尤其是在对象太多的时候。不然就更改不同的名称防止命名错误。

下面有个例子：

```c++
class person{
    public:
      person(int age){
          this->age = age;
          //不用this的话person的参数就不能叫age
      }
    int age;
    
};
```

再来一个this指针返回本体的例子：

```c++
#include<iostream>
#include<string>
using namespace std;

class person {
public:
	person(int age) {
		this->age = age;
	}
	int age;
	person& AddOne() {
		this->age += 1;
		return *this;
	}
};

void main() {
	person Li(19);
	Li.AddOne().AddOne().AddOne().AddOne();//这里是链式的编程
	cout << Li.age << endl;
}
```

打印结果是23

### 10.4 对象数组

```c++
#include<iostream>
#include<string>
using namespace std;

class person {
public:
	string name;
	int age;
	void write(string n, int a) {
		name = n;
		age = a;
	}
};


void main() {
	person people[2];//定义了俩人
	people[0].age = 19;
	people[1].age = 23;
	people[0].name = "Li";
	people[1].name = "Cui";
	for (int i = 0; i < 2; i++) {
		cout << people[i].name << endl;
		cout << people[i].age << endl;
	}

};

```

### 10.5 类作用域

在类中定义的名称（如类数据成员名和类成员函数名）的作用域都为整个类，作用域为整个类的名称只在该类中是已知的，在类外是不可知的。因此，可以在不同类中使用相同的类成员名而不会引起冲突。

也就是说，调用类里面的东西必须要调用类。

## 第十一章  使用类

### 11.1 运算符的重载

关于如何使用重载的运算符，自己琢磨吧，符号还是很多的。也就是运算符号的多功能用法，类似下面代码，可以把同一类的两个参量name“Li"和"Cui"拼接起来，输出"LiCui"；

```c++
#include<iostream>
#include<string>
using namespace std;

class person {
public:
	string name;
	int age;
	void write(string n, int a) {
		name = n;
		age = a;
	}
};


void main() {
	person people[2];//定义了俩人
	people[0].age = 19;
	people[1].age = 23;
	people[0].name = "Li";
	people[1].name = "Cui";
	cout << people[0].name + people[1].name << endl;


};
```

但是你想要将+换成*就不行。

重载有所限制：

- 重载后的运算符必须至少有一个操作数是用户定义的类型，这将防止用户为标准类型重载运算符。因此，不能将减法运算符（−）重载为计算两个double值的和，而不是它们的差。虽然这种限制将对创造性有所影响，但可以确保程序正常运行。
- 使用运算符时不能违反运算符原来的句法规则。同样，不能修改运算符的优先级。因此，如果将加号运算符重载成将两个类相加，则新的运算符与原来的加号具有相同的优先级。
- 不能创建新运算符。例如，不能定义operator **( )函数来表示求幂。
- 不能重载下面的运算符。
  - sizeof：sizeof运算符。
  - .：成员运算符。
  - . *：成员指针运算符。
  - ::：作用域解析运算符。
  - ?:：条件运算符。
  - typeid：一个RTTI运算符。
  - const_cast：强制类型转换运算符。
  - dynamic_cast：强制类型转换运算符。
  - reinterpret_cast：强制类型转换运算符。
  - static_cast：强制类型转换运算符。

- 大多数运算符都可以通过成员或非成员函数进行重载，但下面的运算符只能通过成员函数进行重载。

​            =：赋值运算符。

​           ( )：函数调用运算符。

​           [ ]：下标运算符。

​          ->：通过指针访问类成员的运算符。

### 11.2 友元的概念

之前提及的调用类的方法多是使用类里面的public留出的接口，但是限制比较严格，所有产生友元这种形式的访问权限。

分为：友元函数、友元类、友元成员函数。看下面的代码：

```c++
#include <stdio.h>
#include <math.h>

class Point
{
    double x;
    double y;
public:
    Point(double x, double y)
    {
        this->x = x;
        this->y = y;
    }
    
    double getX()
    {
        return x;
    }
    
    double getY()
    {
        return y;
    }
       
    friend double func(Point& p1, Point& p2);   //friend声明了一个友元函数
};

double func(Point& p1, Point& p2)
{
    double ret = 0;
    
    ret = (p2.y - p1.y) * (p2.y - p1.y) +
          (p2.x - p1.x) * (p2.x - p1.x);
          
    ret = sqrt(ret);
    
    return ret;
}

int main()
{
    Point p1(1, 2);
    Point p2(10, 20);
    
    printf("p1(%f, %f)\n", p1.getX(), p1.getY());
    printf("p2(%f, %f)\n", p2.getX(), p2.getY());
    printf("|(p1, p2)| = %f\n", func(p1, p2));
    
    
    return 0;
}

```

上面的class里面声明的友元函数，它的访问权限和成员函数相同，也就是这个友元函数可以跟在class里面的内部函数一样知道class的内部情况，不过这个友元函数是定义在class之外的。

上面除了friend一个函数，还能friend个class类的东西，或者friend别的class里面的函数。

某种程度友元破坏了class的封装，所以最好在C++编程中不要使用它，免得某种程度有损OOP的理念。





