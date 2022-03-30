%Seth Barger
%EE 487 HW3

clearvars; close all; clc;

V_bus = 5;
kx_l = 0;
f_sw = 10e3;

%define plant parameters
R = 100e-3;
L = 1e-3;
Lambda_pm0oell = 1;
m_tot = 10e3;
bu_tot = 1;

%% %%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%define control gains
kp_elec = 10;
ki_elec = 1e4;

%define electrical plant transfer function
Gp_elec = tf([1], [L R]);

%define currrent regulator transfer function
Gc_elec = tf([kp_elec ki_elec],[1 0]);

%define loop transfer function
Gloop_elec = series(Gc_elec, Gp_elec);

%define total closed-loop transfer function
Gtot_elec = feedback(Gloop_elec, 1);

%plot loop response, total response

figure(1)
bode(Gtot_elec)
legend('Gtot_{elec}')

%calculate bandwidth and DC gain
bandwidth = bandwidth(Gtot_elec); % 10.8792 kHZ, within specified range
DC_gain = dcgain(Gtot_elec); % 1 or 0dB, within specified range

%% %%%%%%%%%%% Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%

%disturbance force
f_d = 0;

%Simulate
sim('hw3_problem2')

%plot output current
figure(2)
plot(tout, i_output)
xlabel('time(s)')
ylabel('current(A)')
title('Output Current of Closed Loop System Problem 2')

%% %%%%%%%%%%%%%%%%%%%%%%%%%%%% Problem 3 %%%%%%%%%%%%%%%%%%%%%%%%

%define control gains
kp_mech = 10;
ki_mech = 1e4;

%define controller transfer function
Gc_mech = tf([kp_mech ki_mech], [1 0]);
Gp_mech = tf([1], [bu_tot kx_l]);

Gtot_1 = series(Gc_mech, Gtot_elec);
Gtot_2 = series(Gtot_1, Gp_mech);

Gtot = feedback(Gtot_2,1);

%bode plots of total response
figure(3)
bode(Gtot)
legend('Gtot')

[gain_margin, phase_margin] = margin(Gtot); %gain margin = 20dB phase margin = 15.9223
totalDC_gain = dcgain(Gtot); %DC gain = 1 or 0dB
% corner frequency = 100 Hz

%% %%%%%%%%%%%%%%%%%%%% Problem 4 %%%%%%%%%%%%%%%%%%%%%

x_0 = 0;
f_d = 0;
sim('hw3_problem4')
figure(4)
plot(tout, i_output)
xlabel('time(s)')
ylabel('current(A)')
title('Output Current of Closed Loop System Problem 4')

figure(5)
plot(tout, x_m)
xlabel('time(s)')
ylabel('position(m)')
title('Position Problem 4')

figure(6)
plot(tout, u_m)
xlabel('time(s)')
ylabel('speed(m/s)')
title('Speed Problem 4')


