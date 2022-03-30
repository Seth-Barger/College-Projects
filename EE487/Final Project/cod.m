% Seth Barger
% EE 487 Final Project

clearvars; clf; clc;

%% Set Machine Parameters

P = 4;
Rs=.1;
Rr=.1;
M=.035;
Ls=M+.0008;
Lr=M+.0008;
Csr = (Ls*Lr)/((Ls*Lr)-M^2);
bw_tot = 0.2;
kt_l = 0;
H_tot = 1.6;

%% Set Simulation Parameters

V_bus = 500;
w_e = 60;

K_p = 1;
K_i = 0;

w_e_command = 2*pi*60;
V_s_command = 0;
t_end = 5;

%% Simulate and Plot

sim('projsim')
figure (1)
plot(tout,(60.*w_r)./(2*pi))
xlabel('time(s)')
ylabel('Rotor Speed(rpm)')
title('Speed of Induction Machine')

figure (2)
plot(tout,Isa)
hold on 
plot(tout,Isb)
hold on 
plot(tout,Isc)
legend('Isa','Isb','Isc')
xlabel('time(s)')
ylabel('Current(A)')
title('Output Currents of an Induction Machine')

figure (3)
plot(tout,tau)
xlabel('time(s)')
ylabel('Torque(N-m)')
title('Torque of Induction Machine')





