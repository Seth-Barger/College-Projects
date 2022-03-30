clc; clearvars;

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
Yp = ((Zp/Zbase)*l)^-1;
Ys = ((Zs/Zbase)*l)^-1;

V1 = 1.05;
Pd1 = 1.15;
Qd1 = .31;
Pd2 = .45;
Qd2 = .2;
P2 = -.45;

Y11 = ((Zs/Zbase)*l)^-1 + ((Zp/Zbase)*l)^-1;
Y22 = Y11;
Y12 = -((Zs/Zbase)*l)^-1;
Y21 = Y12;
Ybus = [Y11 Y12;
        Y21 Y22] ;
    
angleV2_0 = 0;
V2_0 = 1*exp(i*angleV2_0);
f2p0 = abs(Y21)*1.05*cos(angle(V1)-angle(V2_0)+angle(Y21));
deltaP20 = P2 - f2p0;
J0 = -abs(Y21)*1.05*sin(angle(V2_0)-angle(Y21));
deltax0 = (J0)^-1 * deltaP20;

angleV2_1 = (angleV2_0 + deltax0)
V2_1 = 1*exp(i*angleV2_1);
f2p1 = abs(Y21)*1.05*cos(angle(V1)-angle(V2_1)+angle(Y21));
deltaP21 = P2 - f2p1;
J1 = -abs(Y21)*1.05*sin(angle(V2_1)-angle(Y21));
deltax1 = (J1)^-1 * deltaP21;

angleV2_2 = (angleV2_1 + deltax1)
V2_2 = 1*exp(i*angleV2_2);
f2p2 = abs(Y21)*1.05*cos(angle(V1)-angle(V2_2)+angle(Y21));
deltaP22 = P2 - f2p2;
J2 = -abs(Y21)*1.05*sin(angle(V2_2)-angle(Y21));
deltax2 = (J2)^-1 * deltaP22;

angleV2_3 = (angleV2_2 + deltax2)
V2_3 = 1*exp(i*angleV2_3);
f2p3 = abs(Y21)*1.05*cos(angle(V1)-angle(V2_3)+angle(Y21));
deltaP23 = P2 - f2p3;
J3 = -abs(Y21)*1.05*sin(angle(V2_3)-angle(Y21));
deltax3 = (J3)^-1 * deltaP23;

angleV2_4 = (angleV2_3 + deltax3)
V2_4 = 1*exp(i*angleV2_4);
f2p4 = abs(Y21)*1.05*cos(angle(V1)-angle(V2_4)+angle(Y21));
deltaP24 = P2 - f2p4;
J4 = -abs(Y21)*1.05*sin(angle(V2_4)-angle(Y21));
deltax4 = (J4)^-1 * deltaP24;

angleV2_5 = (angleV2_4 + deltax4) * (180/pi)
V2_5 = 1*exp(i*angleV2_5);
V2 = V2_5;

%line flows

S12 = (V1*(conj(V1)-conj(V2))*conj(Ys)) + (abs(V1)^2*conj(Yp))
S21 = (V2*(conj(V2)-conj(V1))*conj(Ys)) + (abs(V2)^2*conj(Yp))

S1 = conj(V1)*(Y11*V1 + Y12*V2)

PG1 = real(S1) + Pd1
QG1 = -real(S1) + Qd1

