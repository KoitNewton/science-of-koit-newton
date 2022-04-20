g = 9.81; % acceleration due to gravity
avo = 6.023e23; % Avogadro’s number
e = exp(1); % base of natural log
pi_4 = pi / 4;
log10e = log10( e );
bar_to_kP = 101.325; % atmospheres to kiloPascals
x = [1 3 0 -1 5];
x(3)
y = 1:0.5:4;
y(2)
%The function linspace can be used to initialize a vector of equally spaced values
linspace(0, 2, 10)    
y = logspace(0, 2, 10)
%This generates the following set of numbers 10 numbers between 100 to 102 (inclusive):
%1.0000, 1.6681, 2.7826, 4.6416, 7.7426, 12.9155, 21.5443, 35.9381,
%59.9484, 100.0000.%
dy = diff(y)
yy = y(1:end-1) + dy./2
plot(yy,dy)
y = [1 4 8 0 -1]'
y = [1 4 8 0 -1]
r = rand(1,7)
r([1 7 2]) = [ ] %assign r(1) r(7) r(2) to 0 ? no delete them
