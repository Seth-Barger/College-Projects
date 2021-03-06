%Seth Barger
%EE 351

clearvars; clc;

f = 2000;
f2 = 16000;
T = 1/f;
T2 = 1/f2;
n = 0:1:10;
n3 = 0:1:147;
nz = 0:1:79;
t = linspace(0,.005,10000);

xt = cos(2*pi*400*t) + 3*sin(2*pi*850*t) - 4*cos(2*pi*180*t);
x = cos(2*pi*400*n*T) + 3*sin(2*pi*850*n*T) - 4*cos(2*pi*180*n*T);
z = cos(2*pi*400*nz*T2) + 3*sin(2*pi*850*nz*T2) - 4*cos(2*pi*180*nz*T2);
a = [1,0,0,0,0,0,0,0];
n1 = 0:1:87;
x1 = kron(x,a);

subplot(2,1,1)
stem(n,x)
title('Sampled Signal')
xlabel('n')
ylabel('x')

subplot(2,1,2)
stem(n1,x1)
title('Sampled Signal')
xlabel('n')
ylabel('x_1')

i = -8: 8;
h = 8*sin(pi*i/8)./(pi*i);
h(9)=1;

figure (2)
y1 = conv(x1,h);
y1 = [y1, zeros(1,length(n3)-length(y1))];
n2 = 0:1:103;
subplot(3,1,1)
stem(n3,y1)
title('Oversampled Signal')
xlabel('n')
ylabel('y_1')

i = -30: 30;
h2 = 8*sin(pi*i/8)./(pi*i);
h2(31)=1;

y2 = conv(x1,h2);
subplot(3,1,2)
stem(n3,y2)
title('Oversampled Signal')
xlabel('n')
ylabel('y_2')

z = [z, zeros(1,length(n3)-length(z))];
subplot(3,1,3)
stem(n3,z)
title('Sampled Signal')
xlabel('n')
ylabel('z')


