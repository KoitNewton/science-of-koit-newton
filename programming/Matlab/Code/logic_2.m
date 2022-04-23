x = [8 1 -4 8 6];
find(x >= max(x))
%{
    any(x) returns the scalar 1 (true) if any element of x is non-zero (true).
    all(x) returns the scalar 1 if all the elements of x are non-zero.
    exist('a') returns 1 if a is a workspace variable. For other possible return
values see help. Note that a must be enclosed in apostrophes.
    find(x) returns a vector containing the subscripts of the non-zero (true) elements
of x,
    This returns the vector [1 4], which are the subscripts of the largest
element (8). It works because the logical expression x >= max(x) returns
a logical vector with 1's only at the positions of the largest elements.

%}
a =1
b =3
if a ~= b % 
    disp("俺は天才！")
end


% Income tax the old-fashioned way
inc = [5000 10000 15000 30000 50000];
for ti = inc
if ti < 10000
tax = 0.1 * ti;
elseif ti < 20000
tax = 1000 + 0.2 * (ti - 10000);
else
tax = 3000 + 0.5 * (ti - 20000);
end
disp( [ti tax] )
end


% Income tax the logical way
inc = [5000 10000 15000 30000 50000];
tax = 0.1 * inc .* (inc <= 10000);
tax = tax + (inc > 10000 & inc <= 20000) ...
.* (0.2 * (inc-10000) + 1000);
tax = tax + (inc > 20000) .* (0.5 * (inc-20000) + 3000);
disp( [inc' tax'] );

x = [0:30:180];
trig(:,1) = x;
trig(:,2) = sin(pi/180*x);
trig(:,3) = cos(pi/180*x);
a = 2 * eye(5);
a(1:4, 2:5) = a(1:4, 2:5) - eye(4);
a(2:5, 1:4) = a(2:5, 1:4) - eye(4)

A = 1000; % amount borrowed
n = 12; % number of payments per year
for r = 0.1 : 0.01 : 0.2
fprintf( '%4.0f%', 100 * r );
for k = 15 : 5 : 25
temp = (1 + r/n) ^ (n*k);
P = r * A * temp / (n * (temp - 1));
fprintf( '%10.2f', P );
end
fprintf( '\n' ); % new line
end