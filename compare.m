function compare(F0, F1, isFix)
% function COMPARE samples the pseudo-sinus signal
% x(t) = sin(2*pi*F0*t + phi)
% at sampling frequency Fs = 16000 Hz in 5 miliseconds
% with different real frequency

% initial
d = 5/1000; % convert duration from milisecond to second
Fs = 16000; % sampling frequency

% sample the signal x(t)
N = d*Fs; % number of samples
n = 0:N-1;

f0 = F0/Fs; % reduced frequency
if isFix
    phi = 0;
else
    phi = 2*pi*rand(1);
end
fprintf('-> F0 = %d, F1 = %d, phi = %g\n', F0, F1, phi);
X0 = sin(2*pi*f0*n + phi);

f1 = F1/Fs; % reduced frequency
if isFix
    phi = 0;
else
    phi = 2*pi*rand(1);
end
fprintf('-> F0 = %d, F1 = %d, phi = %g\n', F0, F1, phi);
X1 = sin(2*pi*f1*n + phi);

% plot signal and save to file
figure; plot(n, X0, 'b', n, X1, 'r');
legend(strcat('F_0 = ', num2str(F0,'%d'), ' Hz'), strcat('F_0 = ', num2str(F1,'%d'), ' Hz'));
fname = sprintf('cF0-%d.eps', F0);
print(fname, '-depsc');