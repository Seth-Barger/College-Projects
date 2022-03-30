% Seth Barger
% EE487 HW1

clc; clearvars;

%% Problem 2

t = linspace(0,(1/60),10000);
v = 5 + 3*cos(120*pi*t) + 5*cos(240*pi*t);
i = 3 + 6*cos(120*pi*t) + 2*cos(360*pi*t);

p = v.*i;
avg_P = mean(p); %% 24.0119 W
% plot(t,p)
% hold on
% plot(t,v)
% hold on
% plot(t,i)

%% Problem 5

sys = tf([1 4 4],[1 3 3 6]);
[zeros,poles,gain] = zpkdata(sys);
bode(sys)
title('Bode Plot of Transfer Function')

%% Problem 6

sim('EE487_HW1_model')
figure (2)
plot(y)
title('Unit Step Response')

