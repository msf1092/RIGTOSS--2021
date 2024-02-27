function FncPlotFr(Fr, Depth)
% Fr vs Depth is plotted here, as the 4th one in results charts:
plot(Fr, Depth,'black')
axis([0 1.1*max(Fr) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]);
title('F_r','fontsize',8);grid
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('F_r')
end
