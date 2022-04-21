% Vertical motion under gravity
g = 9.81; % acceleration due
% to gravity
u = 60; % initial velocity in
% meters/sec
t = 0 : 0.01 : 12.3; % time in seconds
s = u * t - g / 2 * t .^ 2; % vertical displacement
% in meters
plot(t, s,'k','LineWidth',3.5,'color','green')
title( 'Vertical motion under gravity' )
xlabel( 'time' ), ylabel( 'vertical displacement' )
grid