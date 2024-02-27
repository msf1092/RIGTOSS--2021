function FncPlotSchneiderFrQtColorGMM(Depth, Q1, Fr1, ch_d)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Frplot = Fr1;
Qplot  = Q1;

linecolors = ["#0072BD"; "#D95319"; "#EDB120"; "#77AC30"; "#7E2F8E"; "#4DBEEE"; ...
    "#A2142F"; "#FF0000"; "#00FF00"; "#0000FF"; "#00FFFF"; "#FF00FF"; "#FFFF00"; "#000000"];


figure('Name','Schneider Fr chart-PDF-layers','WindowState','maximized','Position',[100 100 450 350])
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
    X = [Fr1(idx(i):idx(i+1),1), Q1(idx(i):idx(i+1),1)];

    % Fit Gaussian model to log-transformed X data
    log_X = log10(X);
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
    gmPDF = @(x, y) arrayfun(@(x0, y0) pdf(newGMModel, [log10(x0) log10(y0)]), x, y); % * 0.01; % scale the PDF in height by 0.1

    g = gca;
    fcontour(gmPDF, [([0.1, 10]), ([1, 1000])], 'LineColor', color, 'Fill', 'off', 'MeshDensity', 100,'LevelStep',.5);
end
% % to create the legend
% for i = 1:length(ch_d)
%     a{i} = sprintf('d=%-5.2f',ch_d(i));
% end
% legend(h, string(a), 'Location', 'best','Interpreter','latex');
legend("off")

set(gca, 'XScale', 'log', 'YScale', 'log');
xlim([0.1, 10]);
ylim([1, 1000]);
grid on;


    
% Ploting the Schneider chart lines
% xlim([0.1,10])
% ylim([1,1000])
xlabel('$F_r$','Interpreter','latex')
ylabel('$Q_t$','Interpreter','latex')
% title('Schneider (2012)', 'fontsize', 7)
set(gca, 'fontName','times', 'fontsize', 8)
set(get(gca,'title'),'Position',[2.95 500 1.0])
% Annotations (Zones names)
text(5.00,  3.5,  '$\textbf{1a}$',   'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(00.2,  2.4,  '$\textbf{1b}$',   'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.13,  7.0,  '$\textbf{1c/3}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.12,  200,  '$\textbf{2}$',    'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');

set(gca, 'XScale', 'log', 'YScale', 'log')

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

legend('off');

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
legend(h, string(a), 'Location', 'northeast','Interpreter','latex');


end

