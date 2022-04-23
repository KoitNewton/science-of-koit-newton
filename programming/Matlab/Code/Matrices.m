% Leslie matrix population model
n = 3;
L = zeros(n); % all elements set to zero
L(1,2) = 9;
L(1,3) = 12;
L(2,1) = 1/3;
L(3,2) = 0.5;
x = [0 0 1]'; % remember x must be a column vector!
for t = 1:24
x = L * x;
disp( [t x' sum(x)] ) % x' is a row
end
p(t) = sum(x);
plot(1:15, p(1:15)), xlabel('months'), ylabel('rabbits')
hold, plot(1:15, p(1:15),'o')