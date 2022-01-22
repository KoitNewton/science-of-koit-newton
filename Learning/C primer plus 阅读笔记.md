# C primer plus 阅读笔记

非正常顺序 具有跳跃性 我觉得没必要写的就略过 毕竟主要面向自己 ——CMY

自行甄别内容正误

## 第十五章  位操作

运算符：~  &   |   ^

<<     >>

&=   |=    ^=   >>=   <<=

### 15.1.2 有符号整数

本来可能会有一些系统使用大端、小端的数据存储模式。

**大端模式：是指一个数据的低位字节序的内容放在高地址处，高位字节序存的内容放在低地址处。**

**小端模式：是指一个数据的低位字节序内容存放在低地址处，高位字节序的内容存放在高地址处。**

现在的CPU基本都是自动兼容上面两种模式的，虽然不同操作系统的选择不一样但是CPU可以兼容。

*补码的表示方法，以一字节为例：*

正值：后七位表示0~127，最高位设置为0；

负值：最高位是1； **一个正值每一位取相反数之后再加一就会得到负值的二进制表示方法。**

如：0000011是3，那么00000011按位取反是11111100，再加1为11111101就是-3。

------



### 15.1.3 二进制小数

许多分数是不可以使用二进制方法精确表示的这是显然的，因为存在许多的无限不循环小数之类的存在。

举个例子：0.553的二进制表示是什么呢？

二进制小数的小数点之后依次是 $2^{-1},2^{-2},2^{-3}......$ 也就是这些值累加凑成小数的值

```c
#include<stdio.h>
#include<float.h>

float qiu2demi(int n) {
	int i = 0;
	float result = 1;
	for (i = 0; i < n; i++) {
		result /= 2;
	}
	return result;
}

int* print_bin(float n)
{
    int i;
	int shuzi[6] = { 0,0,0,0,0,0 };
	for (i = 0; i < 6; i++) {
		if (n >qiu2demi(i+1)) {
			shuzi[i] = 1;
			n = n - qiu2demi(i+1);
		}
	}
	return &shuzi[0];
}

int main() {

	float a = 3.553;
	int i;
	for (i = 0; i < 6; i++) {	
		printf("%d", *(print_bin(a - (int)a)+i));
	}
	return 0;
}
```



利用上面我写的代码，在float精度为小数点后6位数的情况下运行得到0.553小数点部分是：100011即是0.546875

------



### 15.3 位操作符

~ 按位取反    &都是1才返回1     | 有一个1就是1      ^ 必须是1和0才返回结果1

那么举例，如何将a=0101?0010的问号的那一位改成值为1？

```c
#include<stdio.h>
#include<float.h>

void main() {

	signed int a = 0b010100010;
	unsigned int b=a | (1 << 4);//1是00000001，左移4位是00010000；
	printf("%u", b);

}
```



输出178，也就是二进制的010110010；

类似的利用掩码、开关、检测之类的操作就是十分显然的了。

------



### 15.4 位字段

这里是把结构体内部的元素加上位数的限制，类似下面的定义：

```c
struct {
	int a : 5;
	int b : 8;
	unsigned int c : 32;
	_Bool a :1;
} shili;
```

位字段内部的数据类型只能是：_Bool、int、signed int、unsigned int，或者为所选实现版本所提供的类型。这里的类型也可以包含类型限定符。

内部的长度不超过数据类型的最大位数，比如40，40>32是不允许的。

------



### 15.5 对齐特性（C11)

对齐指的是如何安排对象在内存中的位置。例如，为了效率最大化，系统可能要把一个 double 类型的值储存在4 字节内存地址上，但却允许把char储存在任意地址。

Alignof运算符给出一个类型的对齐要求，在关键字Alignof后面的圆括号中写上类型名即可：
                               size_t d_align = _Alignof(float);
假设d_align的值是4，意思是float类型对象的对齐要求是4。也就是说，4是储存该类型值相邻地址的字节数。一般而言，对齐值都应该是2的非负整
数次幂。就是每隔align设置的字节数的地址存储一笔括号内的数据。

C11在stdlib.h库还添加了一个新的内存分配函数，用于对齐动态分配的内存。该函数的原型如下：
                        void *aligned_alloc(size_t alignment, size_t size);

第1个参数代表指定的对齐，第2个参数是所需的字节数，其值应是第1个参数的倍数。与其他内存分配函数一样，要使用free()函数释放之前分配
的内存。

我个人理解的是，所谓的对齐就是找一块完整的地址连续的内存空间去存放数据。要是是整理出一块完整的空间给代码里的变量的话，得操作其它进程，真是不太可能的我觉得。



## 第十六章 C预处理器和C库

编译器会把注释处理为一个空格。且除了换行符号，还会使用一个空格替换所有的空白字符序列。

### 16.2 &3明示常量#define及使用#和##

#define  宏名称   你想要的内容

上述是一个非常常用的预处理方法

#是一个字符串化的运算符

##是一个粘着性的运算符

详细的功能、常见的使用方法如下代码所示：

```C
#include<stdio.h>
#include<float.h>

#define  Li  19
#define  Shijie 5
#define Cui 23
#define Plus 9+3
#define Plus_safe (9+3)
#define word "You are beautiful！"
#define doubleself(x)   ((x)*(x))     //加括号为了安全起见
#define PSQR(X) printf("The square of X is %d.\n", ((X)*(X)))
#define PSQR_change(x) printf("The square of " #x " is %d.\n",((x)*(x)))  //此处使用#字符串化操作符
#define XNAME(n) x ## n  
#define PRINT_XN(n) printf("x" #n " = %d\n", x ## n);

int main() {

	printf("%d\n", Li);//会打印出19
	printf("%d\n", Shijie*2);//打印出10
	printf("%s\n", "Cui岁油腻男子");//会打印Cui岁油腻男子 而不是23岁油腻男子
	printf("%d\n", Plus * 5);//打印24,因为9+3*5=24  而不是12*5=60
	printf("%d\n", Plus * 5);//打印60,因为（9+3）*5=60
	printf("%s\n", word);//打印you are beautiful
	printf("%d\n", doubleself(5));//25
	PSQR(5);//打印The square of X is 25.
	PSQR_change(4+1);//打印The square of 4+1 is 25.
	int x3 = 23;
	PRINT_XN(3); //输出x3 = 23

	return 0;
}

```

我想上述代码清楚的表明了#define宏定义的一种用法，主要是直接替换，但不作用于字符串内部片段，而是当其是个变量时才做替换。

关于变参量的宏  ... 和 _ _VA_ARGS _ _     注意...指代的是最后的______VA_ARGS______

上面是两个左边两个_  中间一个_  右边两个_  没有分隔  但是存在

看下面的代码：

```c
#include<stdio.h>
#include<float.h>

#define Hanshu(...)  printf(__VA_ARGS__)
#define PR(X, ...) printf("Message " #X ": " __VA_ARGS__)


void main() {

	Hanshu("Li\n");   //打印Li                  
	Hanshu("Name is %s, age is %d \n", "ZI", 19);  //打印 Name is ZI, age is 19
	PR(3,"10");


}
```



在嵌套循环中使用宏更有助于提高效率.

------



### 16.5 头文件

通常可以放一些宏定义，类型的定义，宏函数，函数声明（那样一开始调用的时候就声明完毕要用的函数不用管函数在代码的哪一行了），结构模板定义等

#include <名字.h>  从标准系统目录中找这个.h文件

#include "名字.h"  先从当前文件目录找再从标准系统目录中找这个.h文件

#include "地址/名字.h"  从这个地址找这个文件

------



### 16.6 其它指令

#undef指令取消之前的#define定义。#if、#ifdef、#ifndef、#else、#elif和#endif指令用于指定什么情况下编写哪些代码。#line指令用于重置行和文件信息，#error指令用于给出错误消息，#pragma指令用于向编译器发出指令。

```c
#include <stdio.h>
#define JUST_CHECKING
#define LIMIT 4
int main(void)
{
	int i;
	int total = 0;
	for (i = 1; i <= LIMIT; i++)
	{
		total += 2 * i * i + 1;
#ifdef JUST_CHECKING
		printf("i=%d, running total = %d\n", i, total);
#endif
	}
	printf("Grand total = %d\n", total);
	return 0;
}
```

上面所示的代码，如果在把第2行注释掉之后会显示第15行的打印，没有第12行的打印。

```c
#ifndef  name0   
#define  name1 xxx1
#endif
```

上面的处理是假如 name0**没有**被宏定义过那么就执行下面的宏定义，可以不止一行的宏定义，name1和name0名称可以一样。

这种做法可以防止头文件重复编译。

#if、#elif和#endif几乎就和if else的语句一个用法，常用来挑选头文件使用。

------



### 16.7 内联函数（C99）

在函数声明前加 inline static，会使得系统可以尽量快地调用函数，编译器会给出自己的优化。我感觉就是始终把该函数需要的存储资源准备着，一直挂着该函数，相当于main函数中调用内联函数时，内联函数的代码就直接像是复制在main函数中运行一样。

编译器优化内联函数必须知道该函数定义的内容。这意味着内联函数定义与函数调用必须在同一个文件中。鉴于此，一般情况下内联函数都具有内部链接。因此，如果程序有多个文件都要使用某个内联函数，那么这些文件中都必须包含该内联函数的定义。最简单的做法是，把内联函数定义放入头文件，并在使用该内联函数的文件中包含该头文件即可。

------

### 16.8 exit()和atexit()函数

你在main函数中执行到exit()时就会终结程序。

atexit()的括号里面放最多32个指针，往往是函数指针，那么执行到exit()时就会执行完毕atexit()括号内的函数，接着退出程序。
