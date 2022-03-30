%: induction_machine_ssop.m

%==========================================================================
% Find the steady-state operating point of an induction machine given
% the applied stator voltage and the mechanical load torque coefficents.
%==========================================================================

function s = induction_machine_ssop( ...
                Vs, we_pu, rs, Xls, XM, Xlr, rr, K0, varargin)
            
K1 = 0;     if nargin > 8; K1 = varargin{1}; end
K2 = 0;     if nargin > 9; K2 = varargin{2}; end

if (K0 == 0) && (K1 == 0) && (K2 == 0)
    s = 0;
else
    Xls = we_pu*Xls;
    XM  = we_pu*XM;
    Xlr = we_pu*Xlr;

    Xss = Xls + XM;
    Xrr = Xlr + XM;

    d0 = rr*(rs^2 + Xss^2)/XM^2;
    d1 = 2*rs;
    d2 = ((XM^2 - Xss*Xrr)^2 + (rs*Xrr)^2)/(rr*XM^2);

    K2prime = we_pu^2*K2;
    K1prime = -(2*K2prime + we_pu*K1);
    K0prime = -K2prime - K1prime + K0;

    c4 = d2*K2prime;
    c3 = d2*K1prime + d1*K2prime;
    c2 = d2*K0prime + d1*K1prime + d0*K2prime;
    c1 = d1*K0prime + d0*K1prime - Vs^2/we_pu;
    c0 = d0*K0prime;

    sroots = roots([c4 c3 c2 c1 c0]);

    sgn_dlT_over_dlwr ...
        = sign(4*c4*sroots.^3 + 3*c3*sroots.^2 + 2*c2*sroots + c1);

    s = sroots(intersect( ...
            find(abs(imag(sroots)) < eps), ...
            find(sgn_dlT_over_dlwr == -1)));
end

return

%==========================================================================
% 2005-03-17 JSM Created.
% 2010-03-27 JSM Changed to 3-phase model and per unit.
%                Added logic to handle zero load.
%==========================================================================