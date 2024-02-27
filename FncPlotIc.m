function FncPlotIc(Q1, Fr1, Depth)
% Ic vs Depth is plotted here, as the 5th one in results charts:

%Firstly, Ic is calculated:
Ic = ( ( 3.47 - log10(Q1) ) .^ 2 + ( log10(Fr1) + 1.22 ) .^ 2 ) .^ 0.5;

%plot
plot(Ic, Depth,'black')
axis([0 1.1*max(Ic(imag(Ic)==0)) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]);%imagniary parts of Ic complex numbers are ignored: Ic(imag(Ic)==0)
title('I_c','fontsize',8);grid; grid minor
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('I_c')

end

