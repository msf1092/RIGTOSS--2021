function FncPlotDNH(NormNashD, Depth)
% NormDNH vs Depth is plotted here, as the 5th one in results charts:
plot(NormNashD, Depth,'black')
axis([0 1.1*max(NormNashD) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),
title('Norm. D_{N-H}','Fontsize',7),
grid
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('D_{N-H, norm}')
end