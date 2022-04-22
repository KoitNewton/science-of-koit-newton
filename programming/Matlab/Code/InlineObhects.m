h = inline( 'cos(8*t) + cos(9*t)' );
x = 0 : 20/300 : 20;
plot(x, h(x)), grid
f1 = inline( 'x.^2 + y.^2', 'x', 'y' );
f1(1, 2)