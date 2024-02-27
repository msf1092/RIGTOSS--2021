function FncPlotfs(fs, Depth)
% fs vs Depth is plotted here, as the 3rd one in results charts:
plot(fs, Depth,'black')
axis([0 1.1*max(fs) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('f_s','fontsize',8),grid
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('f_s')
end

