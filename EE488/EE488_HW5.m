clc; clearvars;

l12 = 190;
l13 = 95;
l23 = 125;

R = .075;
wL = .511;
wC = (.311e6);
Zs = (R + i*wL);
Zp = i*wC;

Y11 = (Zp*l13)^-1 + (Zs * l13)^-1 + (Zp*l12)^-1 + (Zs * l12)^-1;
Y22 = (Zp*l12)^-1 + (Zs * l12)^-1 + (Zp*l23)^-1 + (Zs * l23)^-1;
Y33 = (Zp*l13)^-1 + (Zs * l13)^-1 + (Zp*l23)^-1 + (Zs * l23)^-1;

Y12 = -(Zs * l12)^-1;
Y13 = -(Zs * l13)^-1;
Y23 = -(Zs * l23)^-1;

Ybus = [Y11 Y12 Y13;
        Y12 Y22 Y23;
        Y13 Y23 Y33]
    
%% %%%%%%%%%%%%%%%%%% Problem 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars;clc;

l = 200; %km
R = 0.074; %?/km
wL = 0.457; %?/km 
wC = 0.211e6; %?/km actually 1/wC
Zs = (R + i*wL);
Zp = (wC*i);

V3base = 230e3;
V1base = V3base / sqrt(3);
S3base = 300e6;
S1base = S3base / 3;
Zbase = V1base^2/S1base;
Ybase = 1/Zbase;

V1 = 1.05;
z1 = 1.15 + i*.31;
z2 = .45 + i*.2;
magV2 = 1;

Y11 = ((Zs/Zbase)*l)^-1 + ((Zp/Zbase)*l)^-1;
Y22 = Y11;
Y12 = -((Zs/Zbase)*l)^-1;
Y21 = Y12;
Ybus = [Y11 Y12;
        Y21 Y22] ;
    
V0th = exp(i*(pi/4));
Q0th = .8;

V1st = (1/Y22)*(((1-i*Q0th)/(1*exp(i*(angle(V0th)))))-1.05*Y21);
Q1st = -((abs(Y21)*1.05*sin(-angle(V1st) + angle(Y21))) + (abs(Y22)*sin(angle(Y22))));

V2nd = (1/Y22)*(((1-i*Q1st)/(1*exp(i*(angle(V1st)))))-1.05*Y21);
Q2nd = -((abs(Y21)*1.05*sin(-angle(V2nd) + angle(Y21))) + (abs(Y22)*sin(angle(Y22))));

V3rd = (1/Y22)*(((1-i*Q2nd)/(1*exp(i*(angle(V2nd)))))-1.05*Y21);
Q3rd = -((abs(Y21)*1.05*sin(-angle(V3rd) + angle(Y21))) + (abs(Y22)*sin(angle(Y22))));

V4th = (1/Y22)*(((1-i*Q3rd)/(1*exp(i*(angle(V3rd)))))-1.05*Y21);
Q4th = -((abs(Y21)*1.05*sin(-angle(V4th) + angle(Y21))) + (abs(Y22)*sin(angle(Y22))));

V5th = (1/Y22)*(((1-i*Q4th)/(1*exp(i*(angle(V4th)))))-1.05*Y21);
Q5th = -((abs(Y21)*1.05*sin(-angle(V5th) + angle(Y21))) + (abs(Y22)*sin(angle(Y22))));


Vcalc = [1.05; exp(i*angle(V5th))];

Icalc = Ybus * Vcalc



