function FncPlotu2(u2, Depth)
% u2 vs Depth is plotted here, :
plot(u2, Depth,'black')
axis([0 1.1*max(u2) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('u_2','fontsize',8),grid
% set(gca, 'YDir','reverse')
set(gca,'YTickLabel',[]);
% ylabel('Depth (m)')
xlabel('u_2')
end

