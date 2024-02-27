function FncPlotRobertsonBqQtColorGMM(Depth, Q1, Bq1, ch_d)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Bqplot = Bq1;
Qplot  = Q1;

linecolors = ["#0072BD"; "#D95319"; "#EDB120"; "#77AC30"; "#7E2F8E"; "#4DBEEE"; ...
    "#A2142F"; "#FF0000"; "#00FF00"; "#0000FF"; "#00FFFF"; "#FF00FF"; "#FFFF00"; "#000000"];


figure('Name','Robertson Bq chart-PDF-layers','WindowState','maximized','Position',[100 100 450 350])
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
    X = [Bq1(idx(i):idx(i+1),1), Q1(idx(i):idx(i+1),1)];

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
    fcontour(gmPDF, [([-0.6, 1.4]), ([1, 1000])], 'LineColor', color, 'Fill', 'off', 'MeshDensity', 100,'LevelStep',.5);
end
% % to create the legend
% for i = 1:length(ch_d)
%     a{i} = sprintf('d=%-5.2f',ch_d(i));
% end
% legend(h, string(a), 'Location', 'best','Interpreter','latex');
legend("off")
set(gca, 'XScale', 'linear', 'YScale', 'log');
xlim([-0.6, 1.4])
ylim([1, 1000])
grid on;




%     k = (0.9 : -0.9/length(Bqplot) : 0)';
%     for i = 1 : length(Bqplot)
%         semilogy(Bqplot(i,1),Qplot(i,1), '*', 'Markersize',2, 'Color',[k(i,1),k(i,1),1]);
%         hold on
%     end
    
% Ploting the Robertson chart lines
% xlim([-0.6,1.4])
% ylim([1,1000])
xlabel('$B_q$', 'Interpreter','latex')
ylabel('$Q_t$', 'Interpreter','latex')
% title('Robertson (1990)', 'fontsize', 7)
set(gca, 'fontName','times', 'fontsize', 8)
set(get(gca,'title'),'Position',[0.88 500 1.0])
% Annotations (Zones names)
text(1.22,  3,    '$\textbf{1}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.47,  1.5,  '$\textbf{2}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.75,  11,   '$\textbf{3}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.37,  36,   '$\textbf{4}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.25,  54,   '$\textbf{5}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.06,  110,  '$\textbf{6}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');
text(0.05,  400,  '$\textbf{7}$', 'fontsize', 9, 'FontWeight','bold','Color','#7E2F8E', 'Interpreter','latex');

set(gca, 'XScale', 'linear', 'YScale', 'log')

grid on

% LINE #1:
hold on
A = -0.0342799;                         B = -0.559838;                      % x-values of start & end points
S = (B - A) / 100;                      x = A : S : B;      xline1 = x;     % x-axis is not logarithmic!
y = 3.265879716 * x + 3.110623052;      yline1 = 10 .^ y;                   % y-axis is logarithmic!
plot(xline1, yline1, 'b');

% LINE #2:
hold on
A = -0.559838;          B = 0.143769;                                   % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline2 = x;         % x-axis is not logarithmic!
y = -1.81820723154216 * x + 0.264357982991879;      yline2 = 10 .^ y;	% y-axis is logarithmic!
plot(xline2, yline2, 'b');

% LINE #3:
hold on
A = 0.143769;           B = 0.544275;                                   % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline3 = x;         % x-axis is not logarithmic!
y = 1.05513081969854 * x - 0.148738955296945;       yline3 = 10 .^ y;	% y-axis is logarithmic!
plot(xline3, yline3, 'b');

% LINE #4:
hold on
A = 0.544275;           B = 0.809322;                                   % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline4 = x;         % x-axis is not logarithmic!
y = -1.60028417238334 * x + 1.29653703951842;       yline4 = 10 .^ y;	% y-axis is logarithmic!
plot(xline4, yline4, 'b');

% LINE #5:
hold on
A = 0.809322;           B = 1.40286;                                    % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline5 = x;         % x-axis is not logarithmic!
y = 1.73399458702212 * x - 1.40196811460112;        yline5 = 10 .^ y;	% y-axis is logarithmic!
plot(xline5, yline5, 'b');

% LINE #6:
hold on
A = 1.40286;            B = 0.17933;                                    % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline6 = x;         % x-axis is not logarithmic!
y = -0.813890117395329 * x + 2.17235742183793;      yline6 = 10 .^ y;	% y-axis is logarithmic!
plot(xline6, yline6, 'b');

% LINE #7:
hold on
A = 0.17933;            B = 0.0855197;                                  % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline7 = x;         % x-axis is not logarithmic!
y = -10.361171128016 * x + 3.88447132547254;        yline7 = 10 .^ y;	% y-axis is logarithmic!
plot(xline7, yline7, 'b');

% LINE #8:
hold on
A = -0.156885;          B = 0.00520958;                                 % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline8 = x;         % x-axis is not logarithmic!
y = -2.21895169636526 * x + 2.25013527539689;       yline8 = 10 .^ y;	% y-axis is logarithmic!
plot(xline8, yline8, 'b');

% LINE #9:
hold on
A = 0.00520958;         B = 0.133948;                                   % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline9 = x;         % x-axis is not logarithmic!
y = 2.00435663416186 * x + 2.22813361278434;        yline9 = 10 .^ y;	% y-axis is logarithmic!
plot(xline9, yline9, 'b');

% LINE #10:
hold on
A = -0.244223;          B = 0.00308895;                                  % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline10 = x;         % x-axis is not logarithmic!
y = -3.39306290179409 * x + 1.48435610858119;       yline10 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline10, yline10, 'b');

% LINE #11:
hold on
A = 0.00308895;         B = 0.224144;                                    % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline11 = x;         % x-axis is not logarithmic!
y = 2.33450323090915 * x + 1.46666394317557;        yline11 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline11, yline11, 'b');

% LINE #12:
hold on
A = -0.311398;          B = 0.00191444;                                  % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline12 = x;         % x-axis is not logarithmic!
y = -3.32985764219691 * x + 1.05672362965961;       yline12 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline12, yline12, 'b');

% LINE #13:
hold on
A = 0.00191444;         B = 0.423366;                                    % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline13 = x;         % x-axis is not logarithmic!
y = 1.8446608701642 * x + 1.0468173244388;          yline13 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline13, yline13, 'b');

% LINE #14:
hold on
A = -0.400367;          B = 0.0009356893;                                % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline14 = x;         % x-axis is not logarithmic!
y = -2.75518403316285 * x + 0.699987821467252;      yline14 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline14, yline14, 'b');

% LINE #15:
hold on
A = 0.0009356893;       B = 0.602674;                                    % x-values of start & end points
S = (B - A) / 100;      x = A : S : B;              xline15 = x;         % x-axis is not logarithmic!
y = 1.63598887834437 * x + 0.695879047959504;       yline15 = 10 .^ y;	 % y-axis is logarithmic!
plot(xline15, yline15, 'b');


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

