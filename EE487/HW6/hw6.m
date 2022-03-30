%Seth Barger
%EE 487 HW6

%% Problem 1

clc; clearvars;
disp('Problem 1')

P = 6;
Rll = 130e-3;
Lll = 540e-6;
wr = 1500; %rpm
wr = (wr/60)*2*pi; %rad/sec
Vll = 75; %Vrms

wre = (P/2) * wr;
lambda_pm = sqrt(2/3)*(Vll/wre)
R = Rll/2
L = Lll/2

%% Problem 2

clearvars;
disp('Problem 2')

P = 4;
lambda_pm = 1;
L = 20e-3;
R = 5;
theta_r = 60;
theta_r = theta_r * (pi/180);
wre = 2*pi*60;

theta_re = (P/2) * theta_r;
id = -(lambda_pm * cos(theta_re))/L
iq = -(lambda_pm * sin(theta_re))/L

ia = id
ib = -.5*id + (sqrt(3)/2)*iq
ic = -.5*id - (sqrt(3)/2)*iq

idr = id*cos(theta_re) + iq*sin(theta_re)
iqr = id*-sin(theta_re) + iq*cos(theta_re)

Vdr = R*idr - wre*L*iqr
Vqr = R*iqr + wre*(L*idr + lambda_pm)

Vd = Vdr*cos(theta_re) - Vqr*sin(theta_re)
Vq = Vdr*sin(theta_re) + Vqr*cos(theta_re)

Va = Vd
Vb = -.5*Vd + (sqrt(3)/2)*Vq
Vc = -.5*Vd - (sqrt(3)/2)*Vq

%% Problem 3

clearvars;
disp('Problem 3')

P = 4;
lambda_pm = .05;
R = 3e-3;
L = 75e-6;
wr = 50; %rpm
wr = (wr/60)*2*pi;

wre = (P/2)*wr;
Ilrms = (wre*lambda_pm)/(sqrt(2)*sqrt(R^2 + (wre*L)^2))

%% Problem 4

clearvars;
disp('Problem 4')

P = 6;
wr = 2500; %rpm
wr = (2500/60)*2*pi;
wre = (P/2)*wr;
lambda_pm = .3;
R = .15;
L = 2e-3;
t3ph = 20;

Ilrms = (wre*lambda_pm)/(sqrt(2)*sqrt(R^2 + (wre*L)^2))
Vll = sqrt(3/2)*wre*lambda_pm
iqr = t3ph/((3*P/4)*lambda_pm)

%part a
pfa = lambda_pm/sqrt(lambda_pm^2+(L*iqr)^2)

%part b
pfb = lambda_pm/sqrt(lambda_pm^2+(L*iqr)^2)

%% Problem 5

clearvars;
disp('Problem 5')

P = 6;
wr = 2500; %rpm
wr = (2500/60)*2*pi;
wre = (P/2)*wr;
lambda_pm = .3;
R = .15;
L = 2e-3;
t3ph = -20;

Ilrms = (wre*lambda_pm)/(sqrt(2)*sqrt(R^2 + (wre*L)^2))
Vll = sqrt(3/2)*wre*lambda_pm
iqr = t3ph/((3*P/4)*lambda_pm)

%part a
pfa = lambda_pm/sqrt(lambda_pm^2+(L*iqr)^2)

%part b
pfb = lambda_pm/sqrt(lambda_pm^2+(L*iqr)^2)

%% Problem 6

clearvars;
disp('Problem 6')

P = 4;
lambda_pm = .07;
L = 250e-6;
Vmax = 330;
Imax = 100;

Ppk = (3/2)*Vmax*Imax
wpk = Vmax/((P/2)*sqrt(lambda_pm^2-(L*Imax)^2));
wpk = (wpk/(2*pi)) * 60 %rpm

%% Problem 7

clearvars;
disp('Problem 7')

P = 4;
lambda_pm = .07;
L = 1.25e-3;
Vmax = 330;
Imax = 100;

Ppk = (3/2)*lambda_pm * (Vmax/L)
wpk = Vmax/((P/2)*sqrt((L*Imax)^2-lambda_pm^2))
wpk = (wpk/(2*pi)) * 60 %rpm

%% Problem 8

clearvars;
disp('Problem 8')

P = 6;
wr = 2500; %rpm
wr = (2500/60)*2*pi;
wre = (P/2)*wr;
lambda_pm = .3;
R = .15;
L = 2e-3;
t3ph = 20;
f_sw = 10e3;
Vbus = 500;

Ilrms = (wre*lambda_pm)/(sqrt(2)*sqrt(R^2 + (wre*L)^2));
Vll = sqrt(3/2)*wre*lambda_pm;
iqr = t3ph/((3*P/4)*lambda_pm);

%control gains
K_pd = 8;
K_id = 0;

K_pq = 5;
K_iq = 0;

%min current
idr = 0;
sim('hw6_problem8')
figure(1)
plot(tout,idr_sim)
title('Minimum Current')
xlabel('time')
ylabel('i_d^r')
figure(2)
plot(tout,iqr_sim)
title('Minimum Current')
xlabel('time')
ylabel('i_q^r')

%min flux linkage
idr = -lambda_pm/L;
sim('hw6_problem8')
figure(3)
plot(tout,idr_sim)
title('Minimum Flux Linkage')
xlabel('time')
ylabel('i_d^r')
figure(4)
plot(tout,iqr_sim)
title('Minimum Flux Linkage')
xlabel('time')
ylabel('i_q^r')

%max power factor
idr = -(lambda_pm/(2*L)) + sqrt((lambda_pm/(2*L)))^2-((t3ph/((3*P/4)*lambda_pm))^2);
sim('hw6_problem8')
figure(5)
plot(tout,idr_sim)
title('Maximum Power Factor')
xlabel('time')
ylabel('i_d^r')
figure(6)
plot(tout,iqr_sim)
title('Maximum Power Factor')
xlabel('time')
ylabel('i_q^r')







