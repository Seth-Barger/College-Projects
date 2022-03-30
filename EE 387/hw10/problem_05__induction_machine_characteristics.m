TITLE = 'problem_05__induction_machine_characteristics'
NAME = 'Seth Barger' % EE 387 Students: change value.

%==========================================================================
% Calculate and plot the steady-state value of the port variables of
% an induction machine as a function of normalized rotor velocity.
%==========================================================================

%==========================================================================
% 2014-01-12 JSM Created.
%==========================================================================

PP = pretty_plotting(12);

%% Set values of essential parameters.
frated = 60;
Prated = 746*5;
Vrated = 208;

P = 2;

rs = 0.3;
Xls = 0.4;
XM = 14.6;
Xlr = 0.4;
rr = 0.24;

fe = 60;
Vsa = 120;

box_properties = {[0 0.5 0], 'FaceAlpha', 0.1};

%% Calculate values of derived parameters.
we = 2*pi*fe;
Xrr = XM + Xlr;
Xss = XM + Xls;

%% Construct characteristics.

% EE 387 Students: add code here.
s = linspace(0,1,1000);
wr = we .* (1-s);
A = j*XM;
B = (rr./s) + j*Xlr;
Zin = rs + (j*Xls) + ((A.*B)./(A+B));
Isa = Vsa./Zin;
SE = 3*Vsa.*conj(Isa);
PE = real(SE);
QE = imag(SE);
pf = cos(angle(Vsa)-angle(Isa));
Te = ((3*XM^2.*(rr./s))./((rr./s).^2+Xrr^2)).*(Vsa^2./(we*abs(Zin).^2));
Tm = (P/2).*Te;
PM = Tm.*wr;
et = (PM./PE)*100;

%% Illustrate real power-speed characteristic.
figure(1)
clf

PE_box = [0.95 1 0 10];
QE_box = [0.95 1 0 5];

subplot(2,2,1)
hold on
patch(PE_box([2 2 1 1]), PE_box([3 4 4 3]), box_properties{:})
plot(wr/we, real(SE)/1000, 'LineWidth', 2)
%axis([0 1 0 5])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itP_E\rm (kW)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,2)
hold on
patch(PE_box([2 2 1 1]), PE_box([3 4 4 3]), box_properties{:})
plot(wr/we, real(SE)/1000, 'LineWidth', 2)
axis(PE_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itP_E\rm (kW)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})
text(0.95, 11, [NAME ' ' datestr(date, 29)], 'BackGround', [1 1 1])

subplot(2,2,3)
hold on
patch(QE_box([2 2 1 1]), QE_box([3 4 4 3]), box_properties{:})
plot(wr/we, imag(SE)/1000, 'LineWidth', 2)
%axis([0 1 0 7])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itQ_E\rm (kVAR)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,4)
hold on
patch(QE_box([2 2 1 1]), QE_box([3 4 4 3]), box_properties{:})
plot(wr/we, imag(SE)/1000, 'LineWidth', 2)
axis(QE_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itQ_E\rm (kVAR)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

%% Illustrate torque-speed and mechanical power-speed characteristics.
figure(2)
clf

Te_box = [0.95 1 0 20];
PM_box = [0.95 1 0 10];

subplot(2,2,1)
hold on
patch(Te_box([2 2 1 1]), Te_box([3 4 4 3]), box_properties{:})
plot(wr/we, Te, 'LineWidth', 2)
%axis([0 1 0 3])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itT_e\rm (N\cdotm)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,2)
hold on
patch(Te_box([2 2 1 1]), Te_box([3 4 4 3]), box_properties{:})
plot(wr/we, Te, 'LineWidth', 2)
axis(Te_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itT_e\rm (N\cdotm)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})
text(0.95, 22, [NAME ' ' datestr(date, 29)], 'BackGround', [1 1 1])

subplot(2,2,3)
hold on
patch(PM_box([2 2 1 1]), PM_box([3 4 4 3]), box_properties{:})
plot(wr/we, PM/1000, 'LineWidth', 2)
%axis([0 1 0 3])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itP_M\rm (kW)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,4)
hold on
patch(PM_box([2 2 1 1]), PM_box([3 4 4 3]), box_properties{:})
plot(wr/we, PM/1000, 'LineWidth', 2)
axis(PM_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itP_M\rm (kW)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

%% Illustrate power factor-speed and efficiency-speed characteristics.
figure(3)
clf

pf_box = [0.95 1 0 1];

subplot(2,2,1)
hold on
patch(pf_box([2 2 1 1]), pf_box([3 4 4 3]), box_properties{:})
plot(wr/we, pf, 'LineWidth', 2)
axis([0 1 0 1])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itpf\rm', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,2)
hold on
patch(pf_box([2 2 1 1]), pf_box([3 4 4 3]), box_properties{:})
plot(wr/we, pf, 'LineWidth', 2)
axis(pf_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\itpf\rm', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})
text(0.95, 110, [NAME ' ' datestr(date, 29)], 'BackGround', [1 1 1])

et_box = [0.95 1 0 100];

subplot(2,2,3)
hold on
patch(et_box([2 2 1 1]), et_box([3 4 4 3]), box_properties{:})
plot(wr/we, et, 'LineWidth', 2)
axis([0 1 0 100])
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\it\eta\rm (%)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})

subplot(2,2,4)
hold on
patch(et_box([2 2 1 1]), et_box([3 4 4 3]), box_properties{:})
plot(wr/we, et, 'LineWidth', 2)
axis(et_box)
grid
grid minor
set(gca, PP.AxisStyle{:})
ylabel('\it\eta\rm (%)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm/\it\omega_e\rm', PP.XLabelStyle{:})
text(0.95, 110, [NAME ' ' datestr(date, 29)], 'BackGround', [1 1 1])

%% Export figures.
if false
    print_meta_file(1, TITLE, 7.2, 5.4)
    print_meta_file(2, TITLE, 7.2, 5.4)
    print_meta_file(3, TITLE, 7.2, 5.4)
    
	print_pdf_file(1, TITLE)
    print_meta_file(2, TITLE, 9, 6)
    print_meta_file(3, TITLE, 9, 6)
end
