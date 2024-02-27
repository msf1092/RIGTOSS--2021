function FncPlotSmoothedFrQ(OutputFolder, Depth, Fr, Q, Fr1, Q1, Bq, Bq1, Deltau2ToSigmaPrimeV0, Deltau2ToSigmaPrimeV01, test_number)
%Plotting the smoothed measured Fr and Q goes here:

% plot Fr:
figure('Name','Measured and smoothed Fr and Q profiles','WindowState','maximized')
tiledlayout(1,8, 'Padding', 'compact', 'TileSpacing', 'compact'); 
nexttile    
% plot Fr:
plot(Fr, Depth)
axis([0 1.1*max(Fr) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('Fr'),grid
set(gca, 'YDir','reverse')
ylabel('Depth (m)')
xlabel('Fr')

nexttile
% plot smoothed Fr:
plot(Fr1, Depth)
axis([0 1.1*max(Fr1) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('smoothed Fr'),grid
set(gca, 'YDir','reverse')
xlabel('Fr')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot Q:
plot(Q, Depth)
axis([0 1.1*max(Q) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('Q'),grid
set(gca, 'YDir','reverse')
xlabel('Q_{t1}')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot smoothed Fr:
plot(Q1, Depth)
axis([0 1.1*max(Q1) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('smoothed Q'),grid
set(gca, 'YDir','reverse')
xlabel('Q_{t1}')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot Bq:
plot(Bq, Depth)
axis([0 1.1*max(Bq) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('B_q'),grid
set(gca, 'YDir','reverse')
xlabel('B_q')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot Bq1:
plot(Bq1, Depth)
axis([0 1.1*max(Bq) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('smoothed B_q'),grid
set(gca, 'YDir','reverse')
xlabel('B_q')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot Deltau2ToSigmaPrimeV0:
plot(Deltau2ToSigmaPrimeV0, Depth)
axis([0 1.1*max(Deltau2ToSigmaPrimeV0) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('\Deltau_2/\sigma^\prime_{v_0}'),grid
set(gca, 'YDir','reverse')
xlabel('\Deltau_2/\sigma^\prime_{v_0}')
ax = gca;
ax.FontSize = 8; %tick labels size

nexttile
% plot Deltau2ToSigmaPrimeV01:
plot(Deltau2ToSigmaPrimeV01, Depth)
axis([0 1.1*max(Deltau2ToSigmaPrimeV01) min(Depth)-0.1*min(Depth) max(Depth)+0.1*min(Depth)]),title('smoothed \Deltau_2/\sigma^\prime_{v_0}'),grid
set(gca, 'YDir','reverse')
xlabel('\Deltau_2/\sigma^\prime_{v_0}')
ax = gca;
ax.FontSize = 8; %tick labels size
set(gcf,'position',[50,50,1200,700])

%% Save figure
fname = OutputFolder;
filename1 = sprintf('Smoothed interpreted params, test_%d', test_number);
%  saveas(figure(2),fullfile(fname,sprintf(filename1, test_number)));
exportgraphics(figure(2),fullfile(fname,sprintf('%s%s', filename1, '.png')), 'Resolution',600);
% saveas(figure(2),fullfile(fname,filename1),'epsc');
% saveas(figure(2),fullfile(fname,filename1),'svg');
end

