%: induction_machine_ic.m

%==========================================================================
% Calculate the initial conditions for the state-space model
% of an induction machine given the stator and rotor current phasors
% and the slip.
%==========================================================================

function x0 = induction_machine_ic(Isa, Ira, s, we_pu, Xls, XM, Xlr)

Xls = we_pu*Xls;
XM  = we_pu*XM;
Xlr = we_pu*Xlr;

isd = real(Isa);
isq = imag(Isa);

ird = real(Ira);
irq = imag(Ira);

psi_md = XM*(isd + ird);
psi_mq = XM*(isq + irq);

x0 = [ ...
    Xls*isd + psi_md
    Xls*isq + psi_mq
    0
    Xlr*ird + psi_md
    Xlr*irq + psi_mq
    0
    (1 - s)*we_pu
    0
    ];

%==========================================================================
% 2005-03-17 JSM Created.
% 2006-11-29 JSM Added wb to facilitate use with variable frequency drives.
% 2008-07-02 JSM Changed to dq from qd.
% 2009-03-25 JSM Changed to using magnetizing flux linkage instead of 
%                matrices.
% 2010-03-29 JSM Changed to 3-phase model.
%==========================================================================
    