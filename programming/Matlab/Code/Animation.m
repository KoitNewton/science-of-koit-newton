for k = 1:16
    plot(fft(eye(k+16)))
    axis equal
    M(k) = getframe;
    end
    movie(M, 5)


% animated sine graph
x = 0;
y = 0;
dx = pi/40;
p = plot(x, y, 'o', 'EraseMode', 'none'); % 'xor' shows only current point
% ' none' shows all points
axis([0 20*pi -2 2])
for x = dx:dx:20*pi
x = x + dx;
y = sin(x);
set(p, 'XData', x, 'YData', y)
drawnow
end




A = [ -8/3 0 0; 0 -10 10; 0 28 -1 ];
y = [35 -10 -7]';
h = 0.01;
p = plot3(y(1), y(2), y(3), 'o', ...
'erasemode', 'none', 'markersize', 2);
axis([0 50 -25 25 -25 25])
hold on
i = 1;
while 1
A(1,3) = y(2);
A(3,1) = -y(2);
ydot = A*y;
y = y + h*ydot;
% Change color occasionally
if rem(i,500) == 0
set(p, 'color', [rand, rand, rand])
end
% Change co-ordinates
set(p, 'XData', y(1), 'YData', y(2), 'ZData', y(3))
drawnow
i=i+1;
end

