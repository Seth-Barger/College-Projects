%Seth Barger
%EE 487 HW4

clearvars; clc;

%% Problem 3

rpm = linspace(2000,5000,10000);
wr = (2*pi.*rpm)./60;
Tmax3 = (15000./wr)-(1250./wr);
plot(rpm,Tmax3)
title('Problem 3')
xlabel('Speed(rpm)')
ylabel('Tourqe(N-m)')

%% Problem 4

Tmax4 = (1200./wr)-(800./wr);
figure (2)
plot(rpm,Tmax4)
title('Problem 4')
xlabel('Speed(rpm)')
ylabel('Tourqe(N-m)')

%% Problem 5

clearvars; clc;

%Machine Parameters
Ra = 1e-3;
La = 1e-3;
P = 4;
Maf = 40e-3;
Rf = 20;
Lf = 200e-3;
Vbus = 48;
f_sw = 10e3;
Iamax = 100;
Ifmax = 1;

%control gains
K_p_f = 100;
K_i_f = 100;

K_p_a = 100;
K_i_a = 100;

%Test Parameters

rpm = 3000;
wr = (2*pi*rpm)/60;
T_step = 5;
If_desired = Vbus/((P/2)*Maf*wr);

sim('Problem5')
figure (3)
plot(tout,Te_out)
xlabel('time')
ylabel('Torque')
title('Problem 5')
figure (4)
plot(tout,Ia_out)
xlabel('time')
ylabel('I_a')
title('Problem 5')
figure (5)
plot(tout,If_out)
xlabel('time')
ylabel('I_f')
title('Problem 5')


