t = 0:.1:2*pi;
subplot(2,2,1)  % 2x2  1st place
plot(t,sin(t))
subplot(2,2,2)  %2x2  2nd place
plot(t,cos(t))
subplot(2,2,4)
plot(t,exp(t))
subplot(2,2,1)  % overwrite picture 1
plot(t,1./(1+t.^2))