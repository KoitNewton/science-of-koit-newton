[x y] = meshgrid(-2:.2:2, -2:.2:2);
z = x .* exp(-x.^2 - y.^2);
c = z; % preserve the original surface
c(1:11,1:21) = NaN*c(1:11,1:21);
mesh(c), xlabel('x-axis'), ylabel('y-axis')