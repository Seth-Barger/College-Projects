% Seth Barger
% EE488 HW7

%% Problem 1

clearvars; clc;

%Set Parameters
Vf = 1;
Xline12 = j*.2;
Xline13 = j*.2;
Xline23 = j*.2;
XT1 = j*.3;
XT2 = j*.6;

%Find Z bus
Y12 = (XT1 + Xline12 + XT2)^-1;
Y13 = (XT1 + Xline13)^-1;
Y23 = (XT2 + Xline23)^-1;
Y21 = Y12;
Y31 = Y13;
Y32 = Y23;
Y11 = (XT1 + Xline12 + Xline13)^-1;
Y22 = (XT2 + Xline12 + Xline23)^-1;
Y33 = (Xline23 + Xline13)^-1;

Ybus = [Y11 Y12 Y13
        Y21 Y22 Y23
        Y31 Y32 Y33];

Zbus = Ybus^-1;

%Find Fault Data
If = Vf/Zbus(3,3); %Fault Current = j.3012255 pu

E1 = (1-(Zbus(1,3)/Zbus(3,3)))*Vf; %Bus 1 voltage = 2.4343 pu
E2 = (1-(Zbus(2,3)/Zbus(3,3)))*Vf; %Bus 2 voltage = .94608 pu
E3 = (1-(Zbus(3,3)/Zbus(3,3)))*Vf; %Bus 3 voltage = 0V

I12 = (E1 - E2)/(Xline12 + XT1 + XT2); %Line 12 current = -j1.3529 pu
I13 = (E1 - E3)/(Xline13 + XT1); %Line 13 current = -j4.8686 pu
I23 = (E2 - E3)/(Xline23 + XT2); %Line 23 current = -j1.1826 pu
I21 = -I12;
I31 = -I13;
I32 = -I23;

IG1 = I12 + I13; %Generator 1 current = -j6.2216 pu
IG2 = I23 + I21; %Generator 2 current = j.170343 pu


%% Problem 2

clearvars; clc;

%Set Parameters
Vf = 1;
Xline12 = j*input('What is the reactance of line 1-2 in pu?');
Xline13 = j*input('What is the reactance of line 1-3 in pu?');;
Xline23 = j*input('What is the reactance of line 2-3 in pu?');;
XT1 = j*input('What is the reactance of transformer 1 in pu?');
XT2 = j*input('What is the reactance of transformer 2 in pu?');
faultbus = input('Which bus is faulted?');

%Find Z bus
Y12 = (XT1 + Xline12 + XT2)^-1;
Y13 = (XT1 + Xline13)^-1;
Y23 = (XT2 + Xline23)^-1;
Y21 = Y12;
Y31 = Y13;
Y32 = Y23;
Y11 = (XT1 + Xline12 + Xline13)^-1;
Y22 = (XT2 + Xline12 + Xline23)^-1;
Y33 = (Xline23 + Xline13)^-1;

Ybus = [Y11 Y12 Y13
        Y21 Y22 Y23
        Y31 Y32 Y33];

Zbus = Ybus^-1;

%Find Fault Data
If = Vf/Zbus(faultbus,faultbus); %Fault Current

E1 = (1-(Zbus(1,faultbus)/Zbus(faultbus,faultbus)))*Vf; %Bus 1 voltage
E2 = (1-(Zbus(2,faultbus)/Zbus(faultbus,faultbus)))*Vf; %Bus 2 voltage
E3 = (1-(Zbus(3,faultbus)/Zbus(faultbus,faultbus)))*Vf; %Bus 3 voltage

I12 = (E1 - E2)/(Xline12 + XT1 + XT2); %Line 12 current
I13 = (E1 - E3)/(Xline13 + XT1); %Line 13 current
I23 = (E2 - E3)/(Xline23 + XT2); %Line 23 current
I21 = -I12;
I31 = -I13;
I32 = -I23;

IG1 = I12 + I13; %Generator 1 current
IG2 = I23 + I21; %Generator 2 current


