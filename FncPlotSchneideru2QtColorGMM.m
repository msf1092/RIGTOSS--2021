function FncPlotSchneideru2QtColorGMM(Depth, Q1, Deltau2ToSigmaPrimeV01, ch_d )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Schneider's chart for the case of point by point:

Deltau2ToSigmaPrimeV0plot   = Deltau2ToSigmaPrimeV01;
Qplot                       = Q1;

linecolors = ["#0072BD"; "#D95319"; "#EDB120"; "#77AC30"; "#7E2F8E"; "#4DBEEE"; ...
    "#A2142F"; "#FF0000"; "#00FF00"; "#0000FF"; "#00FFFF"; "#FF00FF"; "#FFFF00"; "#000000"];


figure('Name','Shneider u2 chart-PDF-layers','WindowState','maximized','Position',[100 100 450 350])
set(gca,'defaulttextinterpreter','latex');


% Finding the indices of layers change depths
for i = 1 : length(ch_d)
    if i == 1
        idx(i,1) = 1;
    else
        idx(i,1) = find(abs(Depth-ch_d(i-1,1)) < 0.005);
        if i == length(ch_d)
            idx(i+1,1) = find(abs(Depth-ch_d(i,1)) < 0.005);
            idx(i+2,1) = length(Depth);
        end
    end
end


% Finding Guassian PDF, and, plotting scatter n PDF
for i = 1 : length(ch_d) + 1
    X = [Deltau2ToSigmaPrimeV01(idx(i):idx(i+1),1), Q1(idx(i):idx(i+1),1)];

    % Fit Gaussian model to log-transformed X data
    log_X = [X(:,1), log10(X(:,2))];
    GMModel = fitgmdist(log_X, 1, 'RegularizationValue', 0.1);

    % Reduce covariance (To draw the PDFs smaller in size)
    newSigma = GMModel.Sigma / 3;  % Adjust this factor as needed
    % Create new GMM with adjusted covariance
    newGMModel = gmdistribution(GMModel.mu, newSigma);

    y = ones(length(X), 1);
    str = num2str(linecolors(i));
    color = sscanf(str(2:end), '%2x%2x%2x', [1 3]) / 255;
    h(i) = gscatter(X(:, 1), X(:, 2), y, color);
    hold on

    % Define Gaussian PDF for log-transformed data
    gmPDF = @(x, y) arrayfun(@(x0, y0) pdf(newGMModel, [(x0) log10(y0)]), x, y); % * 0.01; % scale the PDF in height by 0.1

    g = gca;
    fcontour(gmPDF, [([-4, 12]), ([1, 1000])], 'LineColor', color, 'Fill', 'off', 'MeshDensity', 100,'LevelStep',.5);
end
% % to create the legend
% for i = 1:length(ch_d)
%     a{i} = sprintf('d=%-5.2f',ch_d(i));
% end
% legend(h, string(a), 'Location', 'best','Interpreter','latex');
legend("off")
set(gca, 'XScale', 'linear', 'YScale', 'log');
xlim([-4, 12])
ylim([1, 1000])
grid on;



% Ploting the Robertson chart lines
% xlim([-4, 12])
% ylim([1, 1000])
xlabel('$\Delta u_2 / \sigma ^ \prime_{v0}$', 'Interpreter','latex')
ylabel('$Q_t$', 'Interpreter','latex')
% title('Schneider (2012)', 'fontsize', 7)
set(gca, 'fontName','times', 'fontsize', 8)
set(get(gca,'title'),'Position',[7.5 500 1.0])
% Annotations (zone names)
text(10,  14, '$\textbf{1c}$',   'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(10,  35, '$\textbf{1a/3}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(10, 140, '$\textbf{1b}$',   'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(03, 200, '$\textbf{3}$',    'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0,  400, '$\textbf{2}$',    'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');

set(gca, 'XScale', 'linear', 'YScale', 'log')

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
    

% to create the legend
for i = 1:length(ch_d) + 1
    if i == 1
        a{i} = sprintf('d=%-5.2f--%-5.2f',Depth(1),ch_d(i));
    elseif i == length(ch_d) + 1
        a{i} = sprintf('d=%-5.2f--%-5.2f',ch_d(i-1),Depth(end));
    else
        a{i} = sprintf('d=%-5.2f--%-5.2f',ch_d(i-1),ch_d(i));
    end
end
legend(h, string(a), 'Location', 'southeast','Interpreter','latex');

hold off

end

