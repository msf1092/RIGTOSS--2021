function FncPlotSchneideru2QtColor(Q1, Deltau2ToSigmaPrimeV01)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Schneider's chart for the case of point by point:

Deltau2ToSigmaPrimeV0plot   = Deltau2ToSigmaPrimeV01;
Qplot                       = Q1;

    k = (0.9 : -0.9/length(Deltau2ToSigmaPrimeV0plot) : 0)';
    for i = 1 : length(Deltau2ToSigmaPrimeV0plot)
        semilogy(Deltau2ToSigmaPrimeV0plot(i,1),Qplot(i,1), '*', 'Markersize',2, 'Color',[k(i,1),k(i,1),1]);
        hold on
    end
    
xlim([-4, 12])
ylim([1, 1000])
xlabel('\Deltau_2/\sigma^\prime_{v_0}')
ylabel('Q')
title('Schneider (2012)', 'fontsize', 7)
set(gca, 'fontName','times', 'fontsize', 8)
set(get(gca,'title'),'Position',[7.5 500 1.0])
% Annotations (zone names)
text(10,  14, '\it{1c}',   'fontsize', 6, 'FontWeight','bold','Color','#7E2F8E');
text(10,  35, '\it{1a/3}', 'fontsize', 6, 'FontWeight','bold','Color','#7E2F8E');
text(10, 140, '\it{1b}',   'fontsize', 6, 'FontWeight','bold','Color','#7E2F8E');
text(03, 200, '\it{3}',    'fontsize', 6, 'FontWeight','bold','Color','#7E2F8E');
text(0,  400, '\it{2}',    'fontsize', 6, 'FontWeight','bold','Color','#7E2F8E');
grid on 

% LINE #1:
hold on
A = 1.02005;                            B = 12;                                                             % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;      xline1 = x;                                     % x-axis is not logarithmic!
y = (7861*x.^2 + 29940*x - 44390) ./ (x.^4 + 33.84*x.^3 + 2694*x.^2 + 73050*x - 45724);	yline1 = 10 .^ y;	% y-axis is logarithmic!
plot(xline1, yline1, '--b');

% LINE #2:
hold on
A = 3.8451867916015;                    B = 12;                                 % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;       xline2 = x;         % x-axis is not logarithmic!
y = (1296*x - 2062) ./ (x.^3 - 33.7*x.^2 + 1041*x + 769);    yline2 = 10 .^ y;	% y-axis is logarithmic!
plot(xline2, yline2, 'b');

% LINE #3:
hold on
A = 1.33333;                            B = 12;                                         % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;              xline3 = x;         % x-axis is not logarithmic!
y = (601.3*x - 739.8) ./ (x.^3 - 26.6 *x.^2 + 493.9*x - 255.2);     yline3 = 10 .^ y;	% y-axis is logarithmic!
plot(xline3, yline3, 'b');

% LINE #4:
hold on
A = 0.97;                            B = 11.8699;                                    % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;              xline4 = x;         % x-axis is not logarithmic!
y = (598.1*x - 578.3) ./ (x.^3 - 22.55*x.^2 + 382.3*x - 299.3);     yline4 = 10 .^ y;	% y-axis is logarithmic!
plot(xline4, yline4, 'b');

% LINE #5:
hold on
A = -1.00813;                           B = 0.0321543408360128;                         % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;              xline5 = x;         % x-axis is not logarithmic!
y = -0.7734*x + 1.364;                                              yline5 = 10 .^ y;	% y-axis is logarithmic!
xline5_2 = [-1.00813; -1.00813];        yline5_2 = [10^(-0.7734*(-1.00813) + 1.364); 1000];
plot(xline5, yline5, xline5_2, yline5_2, 'b');

% LINE #6:
hold on
A = 0.0321543408360128;                 B = 1.02981;                                    % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;              xline6 = x;         % x-axis is not logarithmic!
y = 0.8438*x + 1.312;                                               yline6 = 10 .^ y;	% y-axis is logarithmic!
xline6_2 = [1.02981; 1.02981];          yline6_2 = [10^(0.8438*(1.02981) + 1.312); 1000];
plot(xline6, yline6, xline6_2, yline6_2, 'b');

hold off
    
% end
end

