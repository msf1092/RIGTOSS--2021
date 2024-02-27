function FncPlotQ(Q, Depth)
% Q vs Depth is plotted here, as the 2nd one in results charts:
plot(Q, Depth,'black')
axis([0 1.1*max(Q) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('Q','fontsize',8),grid
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('Q')
end

