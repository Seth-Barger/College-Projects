% synchronous_machine_Ea_Edf_given_Vsa_SE  Calculate the internal voltage
%	and excitation of a synchronous machine given the applied stator
%   winding voltage and complex power.  Generator convention is used,
%   and all quantities are in per unit.
%
%   [Ea, Edf, Isa, dl, Isdr] 
%        = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, rs)

function [Ea, Edf, Isa, dl, Isdr] ...
    = synchronous_machine_Ea_Edf_given_Vsa_SE(Vsa, SE, Xd, Xq, varargin)

rs = 0; if nargin > 4; rs = varargin{1}; end;

% EE 387 STUDENTS ADD CODE HERE

Isa = conj(SE./(Vsa));
Ea = Vsa + (rs + 1j*Xq).*Isa;
Isdr = -imag(Isa.*exp(-1j*angle(Ea)));
Edf = abs(Ea) + ((Xd-Xq).*Isdr);
dl = angle(Ea)-angle(Vsa);

%==========================================================================
% 2005-04-11 JSM Created.
% 2006-03-05 JSM Converted from motor to generator convention.
% 2008-03-18 JSM Permitted phase angle of stator voltage to be arbitrary.
% 2008-04-24 JSM Renamed from synchronous_machine_ssop.m.
% 2009-04-17 JSM Renamed from sm_Isa_Idf_dl_given_Vsa_SE.m.
%                Changed input and output arguments.
% 2009-04-21 JSM Converted to per unit.
% 2010-04-14 JSM Reformatted comments for MATLAB help.
%==========================================================================
