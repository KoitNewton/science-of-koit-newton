

% Newton's method in general
% excludes zero roots!
steps = 0; % iteration counter
x = input( 'Initial guess: ' ); % estimate of root
re = 1e-8; % required relative error
myrel = 1;
while myrel > re & (steps < 20)
xold = x;
x = x - f(x)/df(x);
steps = steps + 1;
disp( [x f(x)] )
myrel = abs((x-xold)/x);
end
if myrel <= re
    disp( 'Zero found at' )
    disp( x )
    else
    disp( 'Zero NOT found' )
end




function y = f(x)
    y = x^3 + x - 3;
end
function y = df(x)
    y = 3*x^2 + 1;
end


%{
function [avg, stdev] = stats( x ) % function definition line
    % STATS Mean and standard deviation % H1 line
    % Returns mean (avg) and standard % Help text
    % deviation (stdev) of the data in the
    % vector x, using Matlab functions
end
avg = mean(x); % function body
stdev = std(x);
%}


