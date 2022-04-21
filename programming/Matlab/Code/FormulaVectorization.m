format bank
A = [750 1000 3000 5000 11999];
r = 0.09;
n = 10;
B = A * (1 + r) ^ n;
disp( [A'  B'] )
format compact
x = [1e3 1 1e-4]
%{  We have some choices
format    
format short   
format long   
format short e   
format long e    
format hex      
format bank      
format rat    
format +       
format compact    
format loose       
format long   
format short e   
format long e    
format short g   
format long g 
%}