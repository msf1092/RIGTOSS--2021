function FncPlotRobertsonFrQt(Q1, Fr1)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
%% PLOT Robertson chart for the case of point by point:

Frplot = Fr1;
Qplot  = Q1;

% for i=1:length(Frplot)
    %     subplot(1,4,1);
%     loglog(Frplot,Qplot,'w');
    loglog(Frplot,Qplot,'r*','Markersize',2);
    xlim([0.1,10])
    ylim([1,1000])
    xlabel('F_r')
    ylabel('Q_t')
    title('Robertson (1990)', 'fontsize', 7)
    set(get(gca,'title'),'Position',[2.95 500 1.0])
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
%     M(i)=getframe(figure (2));
    
    
    % LINE #1:
    hold on
    A=log10(.1);B=log10(1.5057);S=(B-A)/100;x=A:S:B;xline1=10.^x;
    y=-2.747*x.^5-7.17*x.^4-7.066*x.^3-3.836*x.^2-1.721*x+0.4744;yline1=10.^y;
    plot(xline1,yline1,'b');
    
%     hold on
%     A=log10(.1);B=log10(1.1865);S=(B-A)/100;x=A:S:B;xline1min=10.^x;
%     y=-3.759*x.^5-10.71*x.^4-11.72*x.^3-6.751*x.^2-2.644*x+0.2387;yline1min=10.^y;
%     plot(xline1min,yline1min,'g:');
%     
%     hold on
%     A=log10(.1);B=log10(1.9108);S=(B-A)/100;x=A:S:B;xline1max=10.^x;
%     y=-2.043*x.^5-4.852*x.^4-4.248*x.^3-2.219*x.^2-1.236*x+0.6515;yline1max=10.^y;
%     plot(xline1max,yline1max,'g:');
    
    % LINE #2:
    hold on
    A=log10(1.5278);B=log10(10);S=(B-A)/100;x=A:S:B;xline2=10.^x;
    y=1.086*x.^4-0.8107*x.^3-0.09045*x.^2+0.8637*x-0.1521;yline2=10.^y;
    plot(xline2,yline2,'b');
    
%     hold on
%     A=log10(2.2501);B=log10(10);S=(B-A)/100;x=A:S:B;xline2min=10.^x;
%     y=0.8666*x.^4-0.7492*x.^3-0.06972*x.^2+0.8854*x-0.2838;yline2min=10.^y;
%     plot(xline2min,yline2min,'g:');
%     
%     hold on
%     A=log10(1.1627);B=log10(10);S=(B-A)/100;x=A:S:B;xline2max=10.^x;
%     y=1.395*x.^4-0.891*x.^3-0.09917*x.^2+0.8345*x-0.02086;yline2max=10.^y;
%     plot(xline2max,yline2max,'g:');
    
    % LINE #3:
    hold on
    A=log10(0.7488);B=log10(6.5817);S=(B-A)/100;x=A:S:B;xline3=10.^x;
    y=0.4864*x.^3+0.2955*x.^2+0.7638*x+0.7346;yline3=10.^y;
    plot(xline3,yline3,'b');
    
%     hold on
%     A=log10(0.7209);B=log10(9.0751);S=(B-A)/100;x=A:S:B;xline3min=10.^x;
%     y=0.4555*x.^3+0.1941*x.^2+0.7365*x+0.6097;yline3min=10.^y;
%     plot(xline3min,yline3min,'g:');
%     
%     hold on
%     A=log10(0.5177);B=log10(5.8432);S=(B-A)/100;x=A:S:B;xline3max=10.^x;
%     y=0.5205*x.^3+0.4109*x.^2+0.8065*x+0.8615;yline3max=10.^y;
%     plot(xline3max,yline3max,'g:');
    
    % LINE #4:
    hold on
    A=log10(0.3141);B=log10(3.4646);S=(B-A)/100;x=A:S:B;xline4=10.^x;
    y=1.204*exp(0.5827*x)+0.003381*exp(8.784*x);yline4=10.^y;
    plot(xline4,yline4,'b');
    
%     hold on
%     A=log10(0.3143);B=log10(4.4414);S=(B-A)/100;x=A:S:B;xline4min=10.^x;
%     y=1.082*exp(0.6326*x)+0.001843*exp(8.422*x);yline4min=10.^y;
%     plot(xline4min,yline4min,'g:');
%     
%     hold on
%     A=log10(0.1698);B=log10(3.1092);S=(B-A)/100;x=A:S:B;xline4max=10.^x;
%     y=1.326*exp(0.5398*x)+0.006151*exp(9.293*x);yline4max=10.^y;
%     plot(xline4max,yline4max,'g:');
    
    % LINE #5:
    hold on
    A=log10(0.1);B=log10(2.3053);S=(B-A)/100;x=A:S:B;xline5=10.^x;
    y=0.7409*x.^4+1.503*x.^3+1.286*x.^2+0.8894*x+1.806;yline5=10.^y;
    plot(xline5,yline5,'b');
    
%     hold on
%     A=log10(0.1);B=log10(2.9528);S=(B-A)/100;x=A:S:B;xline5min=10.^x;
%     y=0.5975*x.^4+1.125*x.^3+0.9403*x.^2+0.7472*x+1.677;yline5min=10.^y;
%     plot(xline5min,yline5min,'g:');
%     
%     hold on
%     A=log10(0.1);B=log10(2.3067);S=(B-A)/100;x=A:S:B;xline5max=10.^x;
%     y=0.9337*x.^4+2.03*x.^3+1.791*x.^2+1.104*x+1.947;yline5max=10.^y;
%     plot(xline5max,yline5max,'g:');
    
    % LINE #6:
    hold on
    A=log10(0.1);B=log10(1.1016);S=(B-A)/100;x=A:S:B;xline6=10.^x;
    y=0.5231*x.^3+1.518*x.^2+1.743*x+2.924;yline6=10.^y;
    plot(xline6,yline6,'b');
    
%     hold on
%     A=log10(0.1);B=log10(1.4299);S=(B-A)/100;x=A:S:B;xline6min=10.^x;
%     y=0.4605*x.^3+1.298*x.^2+1.5*x+2.734;yline6min=10.^y;
%     plot(xline6min,yline6min,'g:');
%     
%     hold on
%     A=log10(0.1);B=log10(0.8477);S=(B-A)/100;x=A:S:B;xline6max=10.^x;
%     y=0.5994*x.^3+1.789*x.^2+2.048*x+3.138;yline6max=10.^y;
%     plot(xline6max,yline6max,'g:');
    
    % LINE #7:
    hold on
    A=log10(1.5113);B=log10(10);S=(B-A)/100;x=A:S:B;xline7=10.^x;
    y=-0.429*x.^4-1.195*x.^3+5.555*x.^2-6.068*x+3.917;yline7=10.^y;
    plot(xline7,yline7,'b');
    
%     hold on
%     A=log10(1.1934);B=log10(10);S=(B-A)/100;x=A:S:B;xline7min=10.^x;
%     y=0.221*x.^4-2.418*x.^3+5.62*x.^2-5.105*x+3.36;yline7min=10.^y;
%     plot(xline7min,yline7min,'g:');
%     
%     hold on
%     A=log10(1.9141);B=log10(10);S=(B-A)/100;x=A:S:B;xline7max=10.^x;
%     y=-1.764*x.^4+2.13*x.^3+3.38*x.^2-6.346*x+4.484;yline7max=10.^y;
%     plot(xline7max,yline7max,'g:');
    
    % LINE #8:
    hold on
    A=log10(3.4635);B=log10(4.9598);S=(B-A)/100;x=A:S:B;xline8=10.^x;
    y=258.4*x.^3-453.1*x.^2+268.6*x-51.57;yline8=10.^y;
    plot(xline8,yline8,'b');
    
%     hold on
%     A=log10(4.0747);B=log10(6.2774);S=(B-A)/100;x=A:S:B;xline8min=10.^x;
%     y=247.4*x.^3-506.2*x.^2+349*x-78.87;yline8min=10.^y;
%     plot(xline8min,yline8min,'g:');
%     
%     hold on
%     A=log10(2.7219);B=log10(3.9399);S=(B-A)/100;x=A:S:B;xline8max=10.^x;
%     y=270*x.^3-394.3*x.^2+195.7*x-30.73;yline8max=10.^y;
%     plot(xline8max,yline8max,'g:');
    
    
%     loglog(Frplot(i),Qplot(i),'r*');
    
    
%     pause(0.1)
    
%     if i>11
%         loglog(Frplot(1),Qplot(1),'w*');
%         %         subplot(1,4,1);
%         loglog(Frplot(i-10),Qplot(i-10),'w*');
%         loglog(Frplot(1),Qplot(1),'w*');
%         xlim([0.1,10])
%         ylim([1,1000])
%         xlabel('Fr')
%         ylabel('Qn')
%     end
    hold off
    
% end
end

