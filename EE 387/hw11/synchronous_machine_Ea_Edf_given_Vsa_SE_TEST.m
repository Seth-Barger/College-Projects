TITLE = 'synchronous_machine_Ea_Edf_given_Vsa_SE_TEST'

%==========================================================================
% Test functions for calculating Ea and Edf of a synchronous machine.
%==========================================================================

%==========================================================================
% 2009-04-23 JSM Created.
%==========================================================================

%%
test_name = 'round rotor machine'

Xd = 1.7;
Xq = 1.7;
rs = 0.012;

Vsa = 1.05;
SE = 0.95*exp(1j*acos(0.9));

Ea_test_target = 1.73021159941126 + 1j*1.37955319543273;
Edf_test_target = 2.21287125648238;

[Ea_test, Edf_test] ...
    = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs);

if abs(Ea_test - Ea_test_target) < 1e-6
    disp(['PASSED: Ea for ' test_name])
else
    disp(['FAILED: Ea for ' test_name])
end

if abs(Edf_test - Edf_test_target) < 1e-6
    disp(['PASSED: Edf for ' test_name])
else
    disp(['FAILED: Edf for ' test_name])
end

%%
test_name = 'salient rotor machine'

Xd = 1.8;
Xq = 1.08;
rs = 0.012;

Vsa = 1.05;
SE = 0.95*exp(1j*acos(0.9));

Ea_test_target = 1.48569812534026 + 1j*0.87469605257558;
Edf_test_target = 2.26620506673072;

[Ea_test, Edf_test] ...
    = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs);

if abs(Ea_test - Ea_test_target) < 1e-6
    disp(['PASSED: Ea for ' test_name])
else
    disp(['FAILED: Ea for ' test_name])
end

if abs(Edf_test - Edf_test_target) < 1e-6
    disp(['PASSED: Edf for ' test_name])
else
    disp(['FAILED: Edf for ' test_name])
end

%%
test_name = 'Vsa as a vector'

Xd = 1.8;
Xq = 1.08;
rs = 0.012;

Vsa = [0.9 1 1.1];
SE = 1*exp(1j*acos(0.9));

try
    [Ea_test, Edf_test] ...
        = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs);
    
    disp(['PASSED: ' test_name])
catch
    disp(['FAILED: ' test_name])
end

%%
test_name = 'SE as a vector'

Xd = 1.8;
Xq = 1.08;
rs = 0.012;

Vsa = 1;
SE = 1*exp(1j*acos([0.8 0.9 1]));

try
    [Ea_test, Edf_test] ...
        = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs);
    
    disp(['PASSED: ' test_name])
catch
    disp(['FAILED: ' test_name])
end

%%
test_name = 'Vsa with non-zero phase angle'

Xd = 1.8;
Xq = 1.08;
rs = 0.012;

Vsa = 1*exp(1j*pi/18);
SE = 1*exp(1j*acos(0.9));

Ea_test_target = 1.29117511309542 + 1j*1.20935230562802;
dl_test_target = 0.57815469007458;

[Ea_test, Edf_test, Isa_test, dl_test] ...
    = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs);

if abs(Ea_test - Ea_test_target) < 1e-6
    disp(['PASSED: Ea for ' test_name])
else
    disp(['FAILED: Ea for ' test_name])
end

if abs(dl_test - dl_test_target) < 1e-6
    disp(['PASSED: dl for ' test_name])
else
    disp(['FAILED: dl for ' test_name])
end
