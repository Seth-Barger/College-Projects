%Seth Barger
%EE 487 Hw 5

clearvars; clc;

%% Problem 1 %%

Ipk = 25;
f = 60;
w = 2*pi*f;
theta_0 = pi/3;
t = [.005, .01, .02];
Id = Ipk*cos((w.*t)+theta_0)
Iq = Ipk*sin((w.*t)+theta_0)

%% Problem 2 %%

clearvars;

Id = 10;
Iq = -15;
theta_f = atan(Iq/Id);
theta_f_deg = theta_f * (180/pi)

%% Problem 3 %%

clearvars;

R = .5;
L = 3e-3;
Irms = 20;
f = 200;
w = 2*pi*f;
t = 1; %Synchronous values don't depend on time, so this doesn't matter
Id = sqrt(2).*Irms.*cos(w.*t);
Id_step = Irms;
Iq = sqrt(2).*Irms.*sin(w.*t);
Iq_step = Irms;
theta_syn = w.*t + pi/4;
Idsyn = cos(theta_syn).*Id + sin(theta_syn).*Iq
Iqsyn = -sin(theta_syn).*Id + cos(theta_syn).*Iq
Vdsyn = (R*Idsyn)-(w*L*Iqsyn)
Vqsyn = (R*Iqsyn)+(w*L*Idsyn)
P2ph = Idsyn*Vdsyn + Iqsyn*Vqsyn
pf = P2ph/(sqrt(Idsyn^2+Iqsyn^2)*sqrt(Vdsyn^2+Vqsyn^2))

%% Problem 4 %%

Vbus = 200;
f_sw = 10e3;

K_p_d = 100;
K_i_d = 10;

K_p_q = 100;
K_i_q = 10;

sim('hw5_problem4')

figure(1)
subplot(2,1,1)
plot(tout,Vd_command)
legend('V_d command')
hold on
subplot(2,1,2)
plot(tout,Vq_command)
legend('V_q command')

figure(2)
subplot(2,1,1)
plot(tout,Id_simout)
legend('I_d')
hold on
subplot(2,1,2)
plot(tout,Iq_simout)
legend('I_q')


%% Problem 5 %%

clearvars;

ia = 20;
ib = -20;
ic = -30;

id = (2/3)*ia - (1/3)*ib - (1/3)*ic
iq = sqrt(3)/3*(ib - ic)

theta_f = atan(iq/id);
theta_f_deg = theta_f * (180/pi)

%% Problem 6 %%

clearvars;

Vllrms = 208;
Vlnrms = 120;
Pin = 10e3;
pf = .75
w = 2*pi*60; %w and t don't matter
t = 1;

Va = sqrt(2)*120.*cos(w.*t);
Vb = sqrt(2)*120.*cos(w.*t - (2*pi/3));
Vc = sqrt(2)*120.*cos(w.*t + (2*pi/3));

Vd = (2/3)*Va - (1/3)*Vb - (1/3)*Vc;
Vq = sqrt(3)/3*(Vb - Vc);

theta_syn = w*t;

Vdsyn = cos(theta_syn).*Vd + sin(theta_syn).*Vq
Vqsyn = -sin(theta_syn).*Vd + cos(theta_syn).*Vq

%% Problem 7 %%

clearvars;

Vbus = 250;
vd = -30;
vq = 120;
Da = .5 + (vd/Vbus)
Db = .5 + ((-.5*vd+(sqrt(3)/2)*vq)/Vbus)
Dc = .5 + ((-.5*vd-(sqrt(3)/2)*vq)/Vbus)

Dd = vd/Vbus;
Dq = vq/Vbus;

Da = (1/2) + (3/2)*Dd
Db = (1/2) + (sqrt(3)/2)*Dq
Dc = (1/2) - (sqrt(3)/2)*Dq








