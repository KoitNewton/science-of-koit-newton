[x y] = meshgrid(-2:.2:2, -2:.2:2);
V = x.^2 + y;
dx = 2*x;
dy = dx; % dy same size as dx
dy(:,:) = 1; % now dy is same size as dx but all 1’s
contour(x, y, V), hold on
quiver(x, y, dx, dy), hold off
[dx dy] = gradient(V, 0.2, 0.2);