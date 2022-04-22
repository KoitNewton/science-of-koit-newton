a = 1:5;
b = [0 2 3 5 6];
a == b % no semi-colon!
r = 1:5;
r <= 3  
x = 0 : pi/20 : 3 * pi;
y = sin(x);
y = y .* (y > 0); % set negative values of sin(x) to zero
plot(x, y)
x = -4*pi : pi/20 : 4*pi;
x = x + (x == 0)*eps; % adjust x = 0 to x = eps
y = sin(x) ./ x;
plot(x, y)
x = -3/2*pi : pi/100 : 3/2*pi;
y = tan(x);
plot(x, y)
r = rand(1,7) % no semi-colon   rand number r < 1 and there 7 numbers
sum( r < 0.5 )

tic % start
a = 0; % number >= 0.5
b = 0; % number < 0.5
for n = 1:5000
r = rand; % generate one number per loop
if r >= 0.5
a = a + 1;
else
b = b + 1;
end;
end;
t = toc; % finish
disp( ['less than 0.5: ' num2str(a)] )
disp( ['time: ' num2str(t)] )

logical([0 1 0 1 0])