function tp1(q)
% function TP1 is to anwser questions in part 1 of project

% environment
clearvars -except q; close all; clc;

if nargin < 1
    q = 0;
end

switch(q)
    case 1 % Q.1
        F0 = 500; % frequency        
        % get figures of x(n)
        sampling(F0);
    case 2 % Q.2.a
        F0 = 200:150:650;
        for i = 1:length(F0)
            sampling(F0(i));
        end
    case 3 % Q.2.b
        F0 = 15350:150:15800;
        Fs = 16000;
        for i = 1:length(F0)
            sampling(F0(i));
            compare(F0(i), Fs-F0(i), true);
        end
    case 4 % Q.2.c
        F0 = 32200:150:32650;
        Fs = 16000;
        for i = 1:length(F0)
            sampling(F0(i));
            compare(F0(i), F0(i)-2*Fs, false);
        end
    otherwise
        fprintf('function TP1 is to anwser questions in part 1 of project.\n');
        fprintf('- Struct: tp1(q)\n');
        fprintf('- Where:\n');
        fprintf('-- q = 1 => to answer question 1.\n');
        fprintf('-- q = 2 => to answer question 2a.\n');
        fprintf('-- q = 3 => to answer question 2b.\n');
        fprintf('-- q = 4 => to answer question 2c.\n');
        fprintf('-- otherwise => help.\n');
end