function FncPlotSchneiderFrQt(Q1, Fr1)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Frplot = Fr1;
Qplot  = Q1;

loglog(Frplot,Qplot,'r*','Markersize',2);
xlim([0.1,10])
ylim([1,1000])
xlabel('F_r')
ylabel('Q_t')
title('Schneider (2012)', 'fontsize', 7)
set(get(gca,'title'),'Position',[2.95 500 1.0])
% Annotations (Zones names)
text(5.00,  3.5,  '\it{1a}',   'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
text(00.2,  2.4,  '\it{1b}',   'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
text(0.13,  7.0,  '\it{1c/3}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
text(0.12,  200,  '\it{2}',    'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
grid on

% LINE #1:
hold on
A = log10(0.1);                         B = log10(10);                                                          % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;      xline1 = 10 .^ x;                                   % x-axis is not logarithmic!
y = (-524.4*x.^2 - 237.6*x + 848.7) ./ (x.^4 + 814.3*x.^3 + 4563*x.^2 - 13510*x + 8155);	yline1 = 10 .^ y;	% y-axis is logarithmic!
plot(xline1, yline1, 'b');

% LINE #2:
hold on
A = log10(0.1);                         B = log10(7.645);                                           % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;      xline2 = 10 .^ x;                       % x-axis is not logarithmic!
y = (-7.102*x + 6.555) ./ (x.^4 + 8.338*x.^3 + 10.15*x.^2 - 46.84*x + 27.2);	yline2 = 10 .^ y;	% y-axis is logarithmic!
plot(xline2, yline2, 'b');

% LINE #3:
hold on
A = log10(0.1);                         B = log10(3.83119);                                                 % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;      xline3 = 10 .^ x;                               % x-axis is not logarithmic!
y = (-327.7*x.^3 + 6481*x.^2 - 9851*x + 3617) ./ (x.^3 + 13580*x.^2 - 17150*x + 5389);	yline3 = 10 .^ y;	% y-axis is logarithmic!
plot(xline3, yline3, 'b');

% LINE #4:
hold on
A = log10(0.1);                         B = log10(0.926);                                                   % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;                                  xline4 = 10 .^ x;   % x-axis is not logarithmic!
y = (-2.599*x + 0.0002874) ./ (x.^4 + 2.418*x.^3 + 2.189*x.^2 - 1.176*x - 0.01241);     yline4 = 10 .^ y;	% y-axis is logarithmic!
plot(xline4, yline4, 'b');

hold off
    
% end
end

