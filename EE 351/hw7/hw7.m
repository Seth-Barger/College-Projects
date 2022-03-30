%Seth Barger
%EE 351 HW7

clearvars; clc;

%% Problem 1d

n = 0:1:40;
x = 5 + 2*cos((pi/5)*n-(pi/6)) + sin(0.95*pi*n-(pi/3));
a = [1,0,.04];
b = [1,0,-1];
y = filter(b,a,x);
figure (1)
subplot(2,1,1)
stem(n,x)
xlabel('n')
ylabel('x[n]')
title('Problem 1d')
subplot(2,1,2)
stem(n,y)
xlabel('n')
ylabel('y[n]')

%% Problem 1e

delta = [1,zeros(1,63)];
f = linspace(0,(2*pi),64);
h = filter(b,a,delta);
H = fft(h);
figure (2)
subplot(2,1,1)
plot(f,abs(H))
xlabel('\Omega')
ylabel('|H(\Omega)|')
title('Problem 1e')
axis([0, 2*pi, -inf, inf])
subplot(2,1,2)
plot(f,angle(H))
xlabel('\Omega')
ylabel('\angle H(\Omega)')
axis([0, 2*pi, -inf, inf])

%% Problem 1f

[H,f] = freqz(b,a,64);
figure (3)
subplot(2,1,1)
plot(f,abs(H))
xlabel('\Omega')
ylabel('|H(\Omega)|')
title('Problem 1f')
axis([0, 2*pi, -inf, inf])
subplot(2,1,2)
plot(f,angle(H))
xlabel('\Omega')
ylabel('\angle H(\Omega)')
axis([0, 2*pi, -inf, inf])

%% Problem 4

f = linspace(-pi,pi,8);
x = ones(1,8);
X = fft(x);
X = fftshift(X);
X = abs(X);
figure (4)
subplot(2,2,1)
stem(f,X)
title('Problem 4a')
xlabel('\Omega')
ylabel('X(\Omega)')

f = linspace(-pi,pi,16);
X = fft(x,16);
X = fftshift(X);
X = abs(X);
subplot(2,2,2)
stem(f,X)
title('Problem 4b 16 samples')
xlabel('\Omega')
ylabel('X(\Omega)')

f = linspace(-pi,pi,64);
X = fft(x,64);
X = fftshift(X);
X = abs(X);
subplot(2,2,3)
stem(f,X)
title('Problem 4c 64 samples')
xlabel('\Omega')
ylabel('X(\Omega)')

f = linspace(-pi,pi,128);
X = fft(x,128);
X = fftshift(X);
X = abs(X);
subplot(2,2,4)
plot(f,X)
grid on
title('Problem 4d 128 samples')
xlabel('\Omega')
ylabel('X(\Omega)')

%% Problem 5

x = [1,2,3];
h = [5,4,3];
y = conv(x,h);
const = 3;
y = ifft(fft(x,const).*fft(h,const));



