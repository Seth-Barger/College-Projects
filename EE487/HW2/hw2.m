% Seth Barger
% EE 487 HW2

clearvars; clc;

%% Problem 2

u = (4*pi*1e-7);
N = 20;
r = 5e-2;
d = 3e-2;
g = 1e-3;
i = -5;

T = (-u*N^2*r*d*i^2)/(4*g);
V = (-u*N^2*r*d*i*-10)/(2*g);



%% Problem 5

clc; clearvars;

t = linspace(0,.2,1000);
wr = 100;
V = .015*cos(wr.*t) + .03*cos(3*wr.*t);

sim('hw2_model')
figure(1)
plot(i)
ylabel('Current')
title('Current vs. Time')
figure(2)
plot(Torque)
ylabel('Torque')
title('Torque vs. Time')




