% x = 0:pi/20:2*pi;
% hsin = plot(x, sin(x))
% hold on
% hx = xlabel('x')
% set(hsin, 'linewidth', 4, "color","green");
% set(hsin(1), 'marker', '*')
% set(hsin(2), 'linew', 4)
% % figure(h) %%Why do not konw 'h'  

% get(hsin)
% hdecay = findobj('marker', 'o' )
set(0, 'units', 'normalized')
h1 = figure('units', 'normalized', 'visible', 'off')
h2 = figure('units', 'normalized', 'visible', 'off')
set(h1, 'position', [0.05 0.5 0.45 0.35], 'visible', 'on')
set(h2, 'position', [0.53 0.5 0.45 0.35], 'visible', 'on')
h1 = figure('un', 'normalized', 'pos', [0.05 0.5 0.45 0.35])