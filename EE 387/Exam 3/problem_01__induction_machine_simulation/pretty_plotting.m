%: pretty_plotting.m

%==========================================================================
% Define some parameters for pretty plotting.
%==========================================================================

%==========================================================================
% 2006-08-29 JSM Forked from original pretty_plotting.m.
%==========================================================================

function PP = pretty_plotting(varargin)

%% Define text and lable styles.
fontsize = 18; if nargin > 0; fontsize = varargin{1}; end;

PP.TextStyle = {'FontName', 'Times New Roman', 'FontSize', fontsize};

PP.Tex = {'Interpreter', 'tex'};
PP.Latex = {'Interpreter', 'latex'};

PP.TitleStyle = {PP.TextStyle{:}};

PP.YLabelStyle = {PP.TextStyle{:}, ...
    'Rotation', 0, 'HorizontalAlignment', 'right'};

PP.XLabelStyle = {PP.TextStyle{:}};

%% Define axis styles.
%AxisStyle = {TextStyle{:}, 'TickLength', [0 0], 'Box', 'off'};
PP.AxisStyle = {PP.TextStyle{:}, 'TickLength', [0 0], 'Box', 'on'};

PP.NoXTickLabels = {'XTickLabelMode', 'manual', 'XTickLabel', ''};
PP.NoYTickLabels = {'YTickLabelMode', 'manual', 'YTickLabel', ''};
PP.NoZTickLabels = {'ZTickLabelMode', 'manual', 'ZTickLabel', ''};

PP.XTick2pi = {'XTickMode', 'manual', 'XTick', [0 pi/2 pi 3*pi/2 2*pi]};
PP.YTick2pi = {'YTickMode', 'manual', 'YTick', [0 pi/2 pi 3*pi/2 2*pi]};

PP.XTick2pi_6 ...
    = {'XTickMode', 'manual', ...
            'XTick', [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3 2*pi]};
        
PP.YTick2pi_6 ...
    = {'YTickMode', 'manual', ...
            'YTick', [0 pi/3 2*pi/3 pi 4*pi/3 5*pi/3 2*pi]};

%% Define colors.
PP.blue =    {'Color', [0     0     1]};
PP.green =   {'Color', [0    0.5    0]};
PP.red =     {'Color', [1     0     0]};
PP.cyan =    {'Color', [0    0.75   0.75]};
PP.magenta = {'Color', [0.75  0     0.75]};
PP.yellow =  {'Color', [0.75 0.75   0]};
PP.black =   {'Color', [0 0 0]};

PP.colors = [
    PP.blue{2}
    PP.green{2}
    PP.red{2}
    PP.cyan{2}
    PP.magenta{2}
    PP.yellow{2}
    ];

PP.copper = [217, 135, 25]/256;
PP.steel = [224, 223, 219]/256;

PP.FieldLineColor = [1 0 0];
PP.FieldVectorColor = [0 0.5 0];

PP.FieldLineStyle = {'Color', PP.FieldLineColor, 'LineWidth', 1};

%% Define default aspect ratio.
PP.AspectRatio = 4/3;

%% Set BodeOptions, if bodeoptions is available.
try
    PP.BodeOptions = bodeoptions;
    %BodeOptions.Title.FontName = 'Times';
    PP.BodeOptions.Title.FontSize = fontsize;
    PP.BodeOptions.XLabel.FontSize = fontsize;
    PP.BodeOptions.YLabel.FontSize = fontsize;
    PP.BodeOptions.Grid = 'on';
    PP.BodeOptions.FreqUnits = 'Hz';
catch
    disp('bodeoptions is not available')
end
