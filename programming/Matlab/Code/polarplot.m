%polar(theta, r)
x = 0:pi/40:2*pi;
subplot(2,2,1)
polar(x, sin(2*x))

subplot(2,2,2)
x = 0.01:0.001:0.1;
plot(x, sin(1./x))

subplot(2,2,3)
fplot('sin(1/x)', [0.01 0.1]) % no, 1./x not needed!

