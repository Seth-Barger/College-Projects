%: induction_machine_per_unit_bases.m

%==========================================================================
% Calculate base quantities given rated values.
%==========================================================================

function [wbase, Zbase, Tbase, Vbase_abc, Vbase_dq, Ibase_abc, Ibase_dq] ...
    = induction_machine_per_unit_bases(frated, Vrated, Prated, P)

wbase = 2*pi*frated;

Sbase = Prated;

Vbase_abc = 1/sqrt(3)*Vrated;
Vbase_dq = sqrt(2)*Vbase_abc;

Zbase = 3*Vbase_abc^2/Sbase;

Ibase_abc = 1/3*Sbase/Vbase_abc;
Ibase_dq = 2*Ibase_abc;

Tbase = Prated/(2/P*wbase);

%==========================================================================
% 2010-03-27 JSM Created.
%==========================================================================