function FncPlotRobertsonFrQtColorGMM(Depth, Q1, Fr1, ch_d)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Frplot = Fr1;
Qplot  = Q1;

linecolors = ["#0072BD"; "#D95319"; "#EDB120"; "#77AC30"; "#7E2F8E"; "#4DBEEE"; ...
    "#A2142F"; "#FF0000"; "#00FF00"; "#0000FF"; "#00FFFF"; "#FF00FF"; "#FFFF00"; "#000000"];


figure('Name','Robertson Fr chart-PDF-layers','WindowState','maximized','Position',[100 100 450 350])
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





% Ploting the Robertson chart lines
% xlim([0.1,10])
% ylim([1,1000])
xlabel('$F_r$','Interpreter','latex')
ylabel('$Q_t$','Interpreter','latex')
%     title('Robertson (1990)', 'fontsize', 7,'Interpreter','latex')
set(gca, 'fontName','times', 'fontsize', 8)
set(get(gca,'title'), 'fontName','times', 'Position',[2.95 500 1.0])
% Annotations (Zones names)
text(0.70,  1.8,  '$\textbf{1}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0005,  1.8,  '$\textbf{2}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(1.70,  2.8,  '$\textbf{3}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.61,  007,  '$\textbf{4}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.30,  018,  '$\textbf{5}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.15,  070,  '$\textbf{6}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(0.15,  600,  '$\textbf{7}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(3.00,  400,  '$\textbf{8}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');
text(7.60,  160,  '$\textbf{9}$', 'fontsize',9, 'FontWeight','bold', 'Color','#7E2F8E','Interpreter','latex');

set(gca, 'XScale', 'log', 'YScale', 'log')

grid on


% LINE #1:
A=log10(.1);B=log10(1.5057);S=(B-A)/100;x=A:S:B;xline1=10.^x;
y=-2.747*x.^5-7.17*x.^4-7.066*x.^3-3.836*x.^2-1.721*x+0.4744;yline1=10.^y;
plot(xline1,yline1,'b');


% LINE #2:
A=log10(1.5278);B=log10(10);S=(B-A)/100;x=A:S:B;xline2=10.^x;
y=1.086*x.^4-0.8107*x.^3-0.09045*x.^2+0.8637*x-0.1521;yline2=10.^y;
plot(xline2,yline2,'b');


% LINE #3:
A=log10(0.7488);B=log10(6.5817);S=(B-A)/100;x=A:S:B;xline3=10.^x;
y=0.4864*x.^3+0.2955*x.^2+0.7638*x+0.7346;yline3=10.^y;
plot(xline3,yline3,'b');


% LINE #4:
A=log10(0.3141);B=log10(3.4646);S=(B-A)/100;x=A:S:B;xline4=10.^x;
y=1.204*exp(0.5827*x)+0.003381*exp(8.784*x);yline4=10.^y;
plot(xline4,yline4,'b');


% LINE #5:
A=log10(0.1);B=log10(2.3053);S=(B-A)/100;x=A:S:B;xline5=10.^x;
y=0.7409*x.^4+1.503*x.^3+1.286*x.^2+0.8894*x+1.806;yline5=10.^y;
plot(xline5,yline5,'b');


% LINE #6:
A=log10(0.1);B=log10(1.1016);S=(B-A)/100;x=A:S:B;xline6=10.^x;
y=0.5231*x.^3+1.518*x.^2+1.743*x+2.924;yline6=10.^y;
plot(xline6,yline6,'b');


% LINE #7:
A=log10(1.5113);B=log10(10);S=(B-A)/100;x=A:S:B;xline7=10.^x;
y=-0.429*x.^4-1.195*x.^3+5.555*x.^2-6.068*x+3.917;yline7=10.^y;
plot(xline7,yline7,'b');


% LINE #8:
A=log10(3.4635);B=log10(4.9598);S=(B-A)/100;x=A:S:B;xline8=10.^x;
y=258.4*x.^3-453.1*x.^2+268.6*x-51.57;yline8=10.^y;
plot(xline8,yline8,'b');

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
legend(h, string(a), 'Location', 'southwest','Interpreter','latex');

end

