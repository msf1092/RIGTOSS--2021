function FncPlotRobertsonFrQtColor(Q1, Fr1)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Frplot = Fr1;
Qplot  = Q1;

    k = (0.9 : -0.9/length(Frplot) : 0)';
    for i = 1 : length(Frplot)
        loglog(Frplot(i,1),Qplot(i,1), '*', 'Markersize',2, 'Color',[k(i,1),k(i,1),1]);
        hold on
    end
    
    xlim([0.1,10])
    ylim([1,1000])
    xlabel('F_r')
    ylabel('Q_t')
    title('Robertson (1990)', 'fontsize', 7)
    set(gca, 'fontName','times', 'fontsize', 8)
    set(get(gca,'title'), 'fontName','times', 'Position',[2.95 500 1.0])
    % Annotations (Zones names)
    text(0.20,  1.8,  '\it{1}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(0005,  1.8,  '\it{2}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(1.70,  2.8,  '\it{3}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(0.61,  009,  '\it{4}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(0.38,  021,  '\it{5}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(0.15,  070,  '\it{6}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(0.15,  600,  '\it{7}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
	text(3.00,  400,  '\it{8}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    text(7.60,  160,  '\it{9}', 'fontsize',6, 'FontWeight','bold', 'Color','#7E2F8E');
    grid on
   
    
    % LINE #1:
    hold on
    A=log10(.1);B=log10(1.5057);S=(B-A)/100;x=A:S:B;xline1=10.^x;
    y=-2.747*x.^5-7.17*x.^4-7.066*x.^3-3.836*x.^2-1.721*x+0.4744;yline1=10.^y;
    plot(xline1,yline1,'b');
    
    
    % LINE #2:
    hold on
    A=log10(1.5278);B=log10(10);S=(B-A)/100;x=A:S:B;xline2=10.^x;
    y=1.086*x.^4-0.8107*x.^3-0.09045*x.^2+0.8637*x-0.1521;yline2=10.^y;
    plot(xline2,yline2,'b');
    
    
    % LINE #3:
    hold on
    A=log10(0.7488);B=log10(6.5817);S=(B-A)/100;x=A:S:B;xline3=10.^x;
    y=0.4864*x.^3+0.2955*x.^2+0.7638*x+0.7346;yline3=10.^y;
    plot(xline3,yline3,'b');
    
    
    % LINE #4:
    hold on
    A=log10(0.3141);B=log10(3.4646);S=(B-A)/100;x=A:S:B;xline4=10.^x;
    y=1.204*exp(0.5827*x)+0.003381*exp(8.784*x);yline4=10.^y;
    plot(xline4,yline4,'b');
    
    
    % LINE #5:
    hold on
    A=log10(0.1);B=log10(2.3053);S=(B-A)/100;x=A:S:B;xline5=10.^x;
    y=0.7409*x.^4+1.503*x.^3+1.286*x.^2+0.8894*x+1.806;yline5=10.^y;
    plot(xline5,yline5,'b');
    
    
    % LINE #6:
    hold on
    A=log10(0.1);B=log10(1.1016);S=(B-A)/100;x=A:S:B;xline6=10.^x;
    y=0.5231*x.^3+1.518*x.^2+1.743*x+2.924;yline6=10.^y;
    plot(xline6,yline6,'b');
    
    
    % LINE #7:
    hold on
    A=log10(1.5113);B=log10(10);S=(B-A)/100;x=A:S:B;xline7=10.^x;
    y=-0.429*x.^4-1.195*x.^3+5.555*x.^2-6.068*x+3.917;yline7=10.^y;
    plot(xline7,yline7,'b');
    
    
    % LINE #8:
    hold on
    A=log10(3.4635);B=log10(4.9598);S=(B-A)/100;x=A:S:B;xline8=10.^x;
    y=258.4*x.^3-453.1*x.^2+268.6*x-51.57;yline8=10.^y;
    plot(xline8,yline8,'b');
    

    hold off
    
% end
end

