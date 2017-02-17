function tp2(q)
% function TP2 is to anwser questions in part 2 of project

% environment
clearvars -except q; close all; clc;

if nargin < 1
    q = 0;
end

switch(q)
    case 3 % Q.3
        k = 0:31;
        X = zeros(1,32);
        X(k==7) = 32;
        stem(k,abs(X));
        xlabel('k'); title('|X(k)|');
        print('lab2q3.eps', '-depsc');
    case 4 % Q.4
        n = 0:31; f0 = 7/32;
        k = 0:31; f = k/32;
        X = zeros(1, 32);
        for i=1:32
            X(i) = sum(exp(1i*2*pi*(f0 - f(i))*n));
            fprintf('|X(%d)| = %g\n', k(i), round(abs(X(i))));
        end
        stem(f, abs(X));
        xlabel('f'); title('|X(k)|');
        print('lab2q4.eps', '-depsc');
    case 5 % Q.5
        N = 32;
        n = 0:N-1;
        f0 = 7/32;
        x = exp(1i*2*pi*f0*n);
        X = fft(x, N);
        k = 0:N-1;
        stem(k,abs(X));
        xlabel('k'); title('|X(k)|');
        print('lab2q5.eps', '-depsc');
    case 6 % Q.6
        N = 32;
        n = 0:N-1;
        f0 = 0.2;
        x = exp(1i*2*pi*f0*n);
        X = fft(x, N);
        k = 0:N-1;
        stem(k,abs(X));
        xlabel('k'); title('|X(k)|');
        print('lab2q6.eps', '-depsc');
    case 7 % Q.7a
        N = 8; L = 32;
        f0 = 0.2;
        n = 0:N-1;
        x = exp(1i*2*pi*f0*n);
        X = fft(x, L);
        
        % plot DFT
        figure; stem(0:L-1,abs(X));
        xlabel('k'); title('|X(k)|');
        print('lab2q7dft.eps', '-depsc');
        
        % plot DTFT
        w = 2*pi*(0:L-1)/L;
        w = fftshift(w);
        w = unwrap(w - 2*pi); % make omega from -pi to pi
        figure; plot(w, abs(fftshift(X)));
        xlabel('\omega'); title('|X(\omega)|');
        print('lab2q7dtft.eps', '-depsc');
    case 8 % Q.7b
        % 8 samples
        N = 8;
        f0 = 0.2;
        n = 0:N-1;
        x = exp(1i*2*pi*f0*n);
        
        % 32 points, 24 zeros added
        L = 32;
        X = fft(x, L);
        f = (0:L-1)/L;
        [~, ind] = max(abs(X)); % index of |X(k)| max
        fprintf('1. DFT of 32 points:\n');
        fprintf('- |X(k)| max corresponds to f = %g\n', f(ind));
        fprintf('- gap between f0 and frequency of |X(k)|max = %g\n', abs(f0 - f(ind)));
        figure; stem(f,abs(X)); hold on;
        
        % 8 points, no zero-padding
        L = 8;
        X = fft(x, L);
        f = (0:L-1)/L;
        [~, ind] = max(abs(X));
        fprintf('2. DFT of 8 points:\n');
        fprintf('- |X(k)| max corresponds to f = %g\n', f(ind));
        fprintf('- gap between f0 and frequency of |X(k)|max = %g\n', abs(f0 - f(ind)));
        plot(f,abs(X),'b');
        
        % 64 points, 56 zeros added
        L = 64;
        X = fft(x, L);
        f = (0:L-1)/L;
        [~, ind] = max(abs(X));
        fprintf('3. DFT of 64 points:\n');
        fprintf('- |X(k)| max corresponds to f = %g\n', f(ind));
        fprintf('- gap between f0 and frequency of |X(k)|max = %g\n', abs(f0 - f(ind)));
        plot(f,abs(X),':'); hold off;
        
        legend('32 points','8 points','64 points');
        xlabel('f'); title('|X(k)|');
        print('lab2q7bdft.eps', '-depsc');
    otherwise
        fprintf('function TP2 is to anwser questions in part 2 of project.\n');
        fprintf('- Struct: tp2(q)\n');
        fprintf('- Where:\n');
        fprintf('-- q = 3 => to answer question 3.\n');
        fprintf('-- q = 4 => to answer question 4.\n');
        fprintf('-- q = 5 => to answer question 5.\n');
        fprintf('-- q = 6 => to answer question 6.\n');
        fprintf('-- q = 7 => to answer question 7a.\n');
        fprintf('-- q = 8 => to answer question 7b.\n');
        fprintf('-- otherwise => help.\n');
end