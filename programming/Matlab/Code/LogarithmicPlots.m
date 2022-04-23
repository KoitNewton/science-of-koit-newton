[x, y] = ginput(5) %you should click mouse 5 times
semilogy(x, y)
x = 0:0.01:4;
semilogy(x, exp(x)), grid