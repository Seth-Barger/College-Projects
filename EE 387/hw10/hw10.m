rs = 0.25;
Xls = .35;
Xm = 18;
Rrprime = .2;
Xlrprime = .35;
P = 6;
Vs = 120;
Xss = Xm + Xls;
Xrr = Xm + Xlrprime;
fe = 60;
we = 2*pi*fe;
ne = (2/P)*60*fe;
%nr = 1175;
%wr = (nr/60)*2*pi;

I1a = Vs/(rs+(j*Xls)+(j*Xm));
A1 = abs(I1a)
B1 = angle(I1a) * (180/pi)

% A2 = abs(Is2)
% B2 = angle(Is2) * (180/pi)
% 
% Te = ((3*Xm^2*(Rrprime/s))/((Rrprime/s)^2+Xrr^2))*(Vs^2/(we*abs(Z)^2))
% Tm = (P/2)*Te
% 
% Pm = wr * Tm

%efficiency = (Pm/real(S)) * 100

Tm = 25;
Te = (2/P)*Tm;

d2 = ((Xm^2-(Xss*Xrr))^2+(rs*Xrr)^2)/(Rrprime*Xm^2);
d1 = 2 * rs;
d0 = (Rrprime*(rs^2+Xss^2))/Xm^2;

p2 = d2;
p1 = d1-((3*Vs^2)/(Te*we));
p0 = d0;
p = [p2,p1,p0];

%s = roots(p)
%s = min(s)

%nr = ne*(1-s)

s = Te/((3*Vs^2)/(d0*we))
nr = ne*(1-s)
wr = (nr/60)*2*pi;

Pe = Te * wr





