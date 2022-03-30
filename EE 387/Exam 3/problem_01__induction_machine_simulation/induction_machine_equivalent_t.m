%: induction_machine_equivalent_t.m

%==========================================================================
% Calculate the steady-state values of the stator and rotor currents
% of an induction machine given the applied stator voltage and slip.
%==========================================================================

function [Isa, Ira] = induction_machine_equivalent_t( ...
                        s, Vsa, we_pu, rs, Xls, XM, Xlr, rr)

Xls = we_pu*Xls;
XM  = we_pu*XM;
Xlr = we_pu*Xlr;

Xrr = Xlr + XM;

Zin = rs + j*Xls + 1/(1/(j*XM) + 1/(rr/s + j*Xlr));

Isa = Vsa/Zin;

Ira = -(j*XM)/(rr/s + j*Xrr)*Isa;

%==========================================================================
% 2005-03-17 JSM Created.
% 2006-11-19 JSM Added wb to facilitate use with variable frequency drives.
% 2010-03-24 JSM Converted to 3-phase model.
%==========================================================================
