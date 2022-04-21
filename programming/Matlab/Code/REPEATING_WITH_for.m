for i = 1:5, disp(i), end  % do 5 times disp(i++)
for i = 1:0, disp(i), end  % do nothing
a = 2;
x = a/2;
disp('如何求2的开方：')
for i = 1:6
x = (x + a / x) / 2;
fprintf("x %d = %d .\n", i,x);
end
disp( 'Matlab''s value: ')
disp( sqrt(2) )



display('##############下面展示阶乘10！################');
n = 10;
fact = 1;
for k = 1:n
fact = k * fact;
disp([k fact])
end


t0 = clock
s = 0;
for n = 1:100000
s = s + n;
end
etime(clock, t0)  %time goes during t0 created to this function does clock func ,always return around 0 s


disp('##################交叉正负分数的累加########################')
sign = -1;
s = 0;
for n = 1:9999
sign = -sign;
s = s + sign / n;
end
display(s)