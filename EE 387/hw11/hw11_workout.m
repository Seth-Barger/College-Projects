%Seth Barger
%EE 387 hw11

clearvars; clc;

%Problem 2
Sbase = 360e6;
Vrated = 24e3;
Zbase = Vrated^2 / Sbase;

rs = .0216;
Xls = .205;
Xd = 1.6;
Xq = .96;

rspu = rs/Zbase;
Xlspu = Xls/Zbase;
Xdpu = Xd/Zbase;
Xqpu = Xq/Zbase;

Vs = 24e3/sqrt(3);
Vbase = Vrated / sqrt(3);
Vspu = Vs / Vbase;

Ibase = Sbase/(3*Vbase);
Isa =8.66e3*exp(j*-25.8*(pi/180));
Isapu = Isa / Ibase;

Eapu = Vspu + (rspu + j*Xqpu)*Isapu;

Isdpu = -imag(sqrt(2)*Isapu*exp(-j*angle(Eapu)));
Edfpu = sqrt(2)*abs(Eapu) + (Xdpu-Xqpu)*Isdpu;
Edf = Edfpu * Vbase
Idfpu = Edfpu/(Xdpu-Xlspu);
Idf = Idfpu * Ibase



