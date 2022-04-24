[x y ] = meshgrid(-8 : 0.5 : 8);
r = sqrt(x.^2 + y.^2) + eps;
z = sin(r) ./ r;
[x y] = meshgrid(0:5);
z = x.^2 - y.^2;
mesh(z)
