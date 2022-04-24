[x y] = meshgrid(-2.1:0.15:2.1, -6:0.15:6); % x- y-grids different
u = 80 * y.^2 .* exp(-x.^2 - 0.3*y.^2);
subplot(2,2,1)
contour(u) 
subplot(2,2,2)
contour3(u)
[x y] = meshgrid(-2:.2:2);
z = x .* exp(-x.^2 - y.^2);
subplot(2,2,3)
meshc(z)
subplot(2,2,4)
surfc(z)