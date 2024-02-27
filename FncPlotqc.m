function FncPlotqc(qc, Depth)
% qc vs Depth is plotted here, as the 1st one in results charts:
plot(qc, Depth,'black')
axis([0 1.1*max(qc) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('q_c','fontsize',8),grid
% set(gca, 'YDir','reverse')
ylabel('Depth (m)')
xlabel('q_c')
end

