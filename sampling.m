function sampling(F0)
% function SAMPLING samples the pseudo-sinus signal
% x(t) = sin(2*pi*F0*t + phi)
% at sampling frequency Fs = 16000 Hz in 5 miliseconds

% initial
d = 5/1000; % convert duration from milisecond to second
phi = 2*pi*rand(1); % random number in [0; 2*pi]
Fs = 16000; % sampling frequency

% sample the signal x(t)
f = F0/Fs; % reduced frequency
N = d*Fs; % number of samples
n = 0:N-1;
Xn = sin(2*pi*f*n + phi);

% plot signal and save to file
figure; plot(n, Xn);
title(strcat({'F_0 = '}, num2str(F0,'%d'), ' Hz'));
fname = sprintf('pF0-%d.eps', F0);
print(fname, '-depsc');

% plot signal as stems and save to file
figure; stem(n, Xn);
title(strcat({'F_0 = '}, num2str(F0,'%d'), ' Hz'));
fname = sprintf('sF0-%d.eps', F0);
print(fname, '-depsc');