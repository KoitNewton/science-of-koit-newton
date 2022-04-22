sqrt([1 2 3 4])
x = -1:.1:1; 
plot(x,abs(x),'o','color','red') 
plot(x,acos(x),'o','color','red') 
plot(x,acosh(x),'o','color','red') 
plot(x,asin(x),'o','color','red') 

t = clock;
fprintf( ' %02.0f:%02.0f:%02.0f\n', t(4), t(5), t(6) );
feet = fix(40/12)
inches = rem(40, 12)

%
% Script to compare the acos(x), asin(x), and atan(x)
% functions over the range -1 < x < 1. The values are
% converted to angles in degrees. The results are
% compared graphically.
%
% Script prepared by D. T. Valentine - September 2006.
% Comments modified by D.T.V. ... 2008/2012/2016/2018.
%
% The question raised is: What range of angles, i.e.,
% which of the four quadrents of the circle from 0 to
% 2*pi are the angular outputs of each of the functions?
%
% Assign the values of x to be examined:
%
x = -1:0.001:1;
%
% Compute the arc-functions:
%
y1 = acos(x);
y2 = asin(x);
y3 = atan(x);
%
% Convert the angles from radians to degrees:
%
y1 = 180*y1/pi;
y2 = 180*y2/pi;
y3 = 180*y3/pi;
%
% Plot the results:
%
plot(y1,x,y2,x,y3,x),grid
legend('asin(x)', 'acos(x)', 'atan(x)')
xlabel('\theta in degrees')
ylabel('x, the argument of the function')
%
% REMARKS: Note the following:
% (1) The acos(x) varies from 0 to 90 to 180 degrees.
% (2) The asin(x) varies from -90 to 0 to 90 degrees.
% (3) The atan(x) varies from -90 to 0 to 90 degrees.
% To check remark (3) try atan(10000000) *180/pi.
%
% Stop