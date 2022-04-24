% ---------Example of the application of FFT------------
% Example of the application of FFT
Fs = 3000; % Sampling frequency
T = 1/Fs; % Sample time
pwr2 = 11;
L = power(2,pwr2); % Length of signal
t = (0:L-1)*T; % Time vector for FFT
% Sum of a 50 Hz sinusoid and a 120 Hz sinusoid
x = 0.7*sin(2*pi*50*t) + sin(2*pi*120*t);
y = x + 2*randn(size(t)); % Sinusoids plus noise at t
plot(Fs*t/1000,y,'k'),axis([0 2 -10 8])
title('Signal Corrupted with Zero-Mean Random Noise')
xlabel('time (seconds)'),ylabel('signal y(t)')
figure(2)
NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(y,NFFT)/L;
Pyy = Y.*conj(Y)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);
%
% ---------Plot single-sided amplitude spectrum.--------
FF = 2*abs(Y(1:NFFT/2+1));
stem(f(1,1:110),FF(1,1:110),'k','Linewidth',2)
title('Single-Sided Amplitude Spectrum of y(t)')
xlabel('Frequency (Hz)')
ylabel('|Y(\omega)|')
figure(3)
stem(f(1:110),Pyy(1:110),'k','Linewidth',2)
title('Power spectral density')
xlabel('Frequency (Hz)')
ylabel('Pyy')