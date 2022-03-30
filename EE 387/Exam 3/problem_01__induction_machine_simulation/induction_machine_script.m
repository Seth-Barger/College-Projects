TITLE = 'induction_machine_script';
NAME = 'Seth Barger';

%==========================================================================
% Exercise Simulink model of an induction machine.
%==========================================================================

%==========================================================================
% 2016-04-13 JSM Forked from standard script and customized for take-home
%                exam.
%==========================================================================

PP = pretty_plotting(12);
LINEWIDTH = 1.5;

%% Select NEMA class.
NEMAclass = 'A';

if NEMAclass == 'A'
    rrfactor = 1;
elseif NEMAclass == 'D'
    rrfactor = 4;
else
    display('This code is only valid for NEMA Class A or D')
    stop
end

%% Set values of essential parameters.
frated = 60;
Vrated = 220;
Prated = 746*10;

P = 6;

rs = 0.0453;
Xls = 0.0775;
XM = 2.042;
Xlr = 0.0322;
rr = rrfactor*0.0222;

H = 0.5;
D = 0;

J = [
        0 -1
        1  0
    ];

J0 = [
        J           zeros(2,1)
        zeros(1,2)  0
     ];

TC = [
        2/3 -1/3       -1/3
        0    sqrt(3)/3 -sqrt(3)/3
        1/3  1/3        1/3
     ];
    
inv_TC = inv(TC);

K2 = 0;
K1_si = 30/1000*(1/0.73756214728)*(60/(2*pi));
K0 = 0;

Vs = 1;
we_pu = 1;
phvs = 0;

w_pu = 1;

the0_pu = 0;
thr0_pu = 0;
th0_pu = 0;

start_time = -0.1;
stop_time =  1.;
max_step_size = 50e-6;

t_lim = [start_time stop_time];
vsa_lim = 1.5*[-1 1];
isa_lim = 12*[-1 1];
Te_lim = 5*[-1 1];
wr_lim = [-0.2 1.2];

title_string = ['Class ' NEMAclass ' Induction Machine Response' ...
    ' (all variables in pu)'];

%% Calculate values of derived parameters.
Xa = 1/(1/XM + 1/Xls + 1/Xlr);

[wbase, Zbase, Tbase, Vbase_abc, Vbase_dq, Ibase_abc, Ibase_dq] ...
    = induction_machine_per_unit_bases(frated, Vrated, Prated, P);

K1 = (2/P*wbase)/Tbase*K1_si;

%% Run the Simulink model.
MODEL_NAME = 'induction_machine_harness';

we_pu_in.time = [start_time stop_time]';
we_pu_in.signals.values = we_pu*[1 1]';

w_pu_in.time = [start_time 0.10 0.15 stop_time]';
w_pu_in.signals.values = w_pu*[1 0.25 1 1]';

scenario = 0;

if scenario == 0        % start up   
    Vs_in.time = [start_time 0 stop_time]';
    Vs_in.signals.values = Vbase_abc*[0 Vs Vs]';

	K0_in.time = [start_time stop_time]';
    K0_in.signals.values = [0 0]';

    psi_sdq0_initial_condition = zeros(3, 1);
    psi_rdq0_initial_condition = zeros(3, 1);
    
    wr0_pu = 0;
elseif scenario == 1	% load changes
    K2 = 0;
    K1 = 0;
    K0 = 1;
    
    Vs_in.time = [start_time stop_time]';
    Vs_in.signals.values = Vbase_abc*[Vs Vs]';
    
	K0_in.time = [start_time 0 stop_time]';
    K0_in.signals.values = K0*[1 2 2]';
    
    s0 = induction_machine_ssop( ...
            Vs, we_pu, rs, Xls, XM, Xlr, rr, K0, K1, K2);

    [Isa, Ira] ...
        = induction_machine_equivalent_t( ...
            s0, Vs, we_pu, rs, Xls, XM, Xlr, rr);

    pdc(Isa);
    pdc(Ira);
        
    x0 = induction_machine_ic(Isa, Ira, s0, we_pu, Xls, XM, Xlr);
    
	psi_sdq0_initial_condition = x0(1:3);
    psi_rdq0_initial_condition = x0(4:6);
    
    wr0_pu = x0(7);   
elseif scenario == 2	% short circuit
    % EE 387 Students: Leave this scenario blank.
elseif scenario == 3	% start-up with long cable
    % EE 387 Students: Add code for this scenario.
    
    line_length = 50;
    Z_per_length = .6465e-3 + j*.08284e-3;
    Z_line = Z_per_length * line_length;
    Z_line_pu = Z_line/Zbase;
    
    Xls = Xls + imag(Z_line_pu);
    rs = rs +real(Z_line_pu);
    
    s0 = induction_machine_ssop( ...
            Vs, we_pu, rs, Xls, XM, Xlr, rr, K0, K1, K2);

    [Isa, Ira] ...
        = induction_machine_equivalent_t( ...
            s0, Vs, we_pu, rs, Xls, XM, Xlr, rr);
        
    
    Vs_in.time = [start_time 0 stop_time]';
    Vs_in.signals.values = Vbase_abc*[0 Vs Vs]';

	K0_in.time = [start_time stop_time]';
    K0_in.signals.values = [0 0]';
    
    wr0_pu = 0;
else
    disp('Only scenarios 0 through 3 are supported.')
end

t = sim(MODEL_NAME);

%% Illustrate response of phase variables in pu.
figure(1)
clf

%------ Plot stator phase voltages. ---------------------------------------
subplot(5,1,1)
plot(t, vsabc_si/Vbase_abc, 'LineWidth', LINEWIDTH);
ylim(vsa_lim)
title(title_string, PP.TextStyle{:})
ylabel('\bfv\rm_{\itsabc\rm}', PP.YLabelStyle{:})

%------ Plot stator phase currents. ---------------------------------------
subplot(5,1,2)
plot(t, isabc_si/Ibase_abc, 'LineWidth', LINEWIDTH);
ylim(isa_lim)
ylabel('\bfi\rm_{\itsabc\rm}', PP.YLabelStyle{:})

%------ Plot rotor phase currents. ----------------------------------------
subplot(5,1,3)
plot(t, irabc_si/Ibase_abc, 'LineWidth', LINEWIDTH);
ylim(isa_lim)
ylabel('\bfi\rm^\prime_{\itrabc\rm}', PP.YLabelStyle{:})

%------ Plot electromagnetic torque. --------------------------------------
subplot(5,1,4)
plot(t, Te_shaft/Tbase, 'LineWidth', LINEWIDTH);
ylim(Te_lim)
ylabel('\itT_e\rm', PP.YLabelStyle{:})

%------ Plot rotor velocity. ----------------------------------------------
subplot(5,1,5)
plot(t, wr_shaft*P/2/wbase, 'LineWidth', LINEWIDTH);
ylabel('\it\omega_r\rm', PP.YLabelStyle{:})
xlabel('\itt\rm (s)')

%------ Adjust axes. ------------------------------------------------------
handles = findobj(gcf, 'type', 'axes');

for h = 1:length(handles)
    set(handles(h), 'pos', get(handles(h), 'pos') + [0.02 -0.025 0 0.025])
    set(handles(h), 'XLim', t_lim)
    set(handles(h), 'XGrid', 'on', 'YGrid', 'on')
    set(handles(h), PP.AxisStyle{:})
    if h == 1; axis(handles(1)); text(0, 0.5, [NAME '  ' date]); end
	if h ~= 1; set(handles(h), PP.NoXTickLabels{:}); end
end

%% Illustrate response of transform variables in pu.
figure(2)
clf

%------ Plot stator dq voltages. ------------------------------------------
subplot(5,1,1)
plot(t, vsdq0, 'LineWidth', LINEWIDTH);
ylim(vsa_lim)
title(title_string, PP.TextStyle{:})
ylabel('\bfv\rm_{\itsdq0\rm}', PP.YLabelStyle{:})

%------ Plot stator dq currents. ------------------------------------------
subplot(5,1,2)
plot(t, isdq0, 'LineWidth', LINEWIDTH);
ylim(isa_lim)
ylabel('\bfi\rm_{\itsdq0\rm}', PP.YLabelStyle{:})

%------ Plot rotor dq currents. -------------------------------------------
subplot(5,1,3)
plot(t, irdq0, 'LineWidth', LINEWIDTH);
ylim(isa_lim)
ylabel('\bfi\rm^\prime_{\itrdq0\rm}', PP.YLabelStyle{:})

%------ Plot electromagnetic torque. --------------------------------------
subplot(5,1,4)
plot(t, Te_shaft/Tbase, 'LineWidth', LINEWIDTH);
ylim(Te_lim)
ylabel('\itT_e\rm', PP.YLabelStyle{:})

%------ Plot rotor velocity. ----------------------------------------------
subplot(5,1,5)
plot(t, wr_shaft*P/2/wbase, 'LineWidth', LINEWIDTH);
ylabel('\it\omega_r\rm', PP.YLabelStyle{:})
xlabel('\itt\rm (s)')

%------ Adjust axes. ------------------------------------------------------
handles = findobj(gcf, 'type', 'axes');

for h = 1:length(handles)
    set(handles(h), 'pos', get(handles(h), 'pos') + [0.02 -0.025 0 0.025])
    set(handles(h), 'XLim', t_lim)
    set(handles(h), 'XGrid', 'on', 'YGrid', 'on')
    set(handles(h), PP.AxisStyle{:})
    if h == 1; axis(handles(1)); text(0, 0.5, [NAME '  ' date]); end
	if h ~= 1; set(handles(h), PP.NoXTickLabels{:}); end
end

%% Calculate steady-state torque-speed characteristic.
Xss = Xls + XM;
Xrr = Xlr + XM;

d0 = rr*(rs^2 + Xss^2)/XM^2;
d1 = 2*rs;
d2 = ((XM^2 - Xss*Xrr)^2 + (rs*Xrr)^2)/(rr*XM^2);

wr_pu_ss = linspace(0, 1);

s = 1 - wr_pu_ss;

Te_ss = s./(d0 + d1*s + d2*s.*s)*(Vs^2/1);

%% Illustrate dynamic and steady-state torque-speed characteristics.
figure(3)
clf

handles = plot(wr_shaft*P/2/wbase, Te_shaft/Tbase, wr_pu_ss, Te_ss);
set(handles, 'LineWidth', LINEWIDTH)

xlim([-0.2 1.2])
ylim([-2 6])

grid

set(gca, PP.AxisStyle{:})

title(['Comparison of Dynamic and Steady-State ' ...
        '\itT_e-\omega_r\rm\bf Characteristics (Class ' NEMAclass ')'], ...
        PP.TextStyle{:})

ylabel('\itT_e\rm (pu)', PP.YLabelStyle{:})
xlabel('\it\omega_r\rm (pu)', PP.XLabelStyle{:})

%==========================================================================
%% Export figures.
if false
    file_name = [TITLE '_class_' NEMAclass '_scenario_' int2str(scenario)];
    
	print_pdf_file(1, file_name)
    print_pdf_file(2, file_name)
	print_pdf_file(3, file_name)
end
