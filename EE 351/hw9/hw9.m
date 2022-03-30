%Seth Barger
%EE 351 Homework 9

clearvars; clc;

%% Problem 1

disp('Problem 1')
x = [-2,5,1];
h = [4,1,-2];
y = conv(x,h)
y = ifft(fft(x).*fft(h))
y = ifft(fft(x,5).*fft(h,5))

