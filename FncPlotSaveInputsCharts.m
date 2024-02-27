function FncPlotSaveInputsCharts(CodesFolder, OutputFolder, Depth, ...
    Gamma_Robertson, Gamma_Mayne, Gamma_median_Robertson, Gamma_median_Mayne, ...
    sigmav0_Robertson, sigmav0_Mayne, sigmav0_median_Robertson, sigmav0_median_Mayne, ...
    sigmaPrimev0_Robertson, sigmaPrimev0_Mayne, sigmaPrimev0_median_Robertson, sigmaPrimev0_median_Mayne, ...
    Q_Robertson, Q_Mayne, Q_median_Robertson, Q_median_Mayne, ...
    Fr_Robertson, Fr_Mayne, Fr_median_Robertson, Fr_median_Mayne, ...
    Bq_Robertson, Bq_Mayne, Bq_median_Robertson, Bq_median_Mayne, ...
    Deltau2ToSigmaPrimeV0_Robertson, Deltau2ToSigmaPrimeV0_Mayne, Deltau2ToSigmaPrimeV0_median_Robertson, Deltau2ToSigmaPrimeV0_median_Mayne, ...
    test_number)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% figure(2)
% contour3D(SBT,Depth);
%% All plots

% figure('Name','Input parameters','WindowState','maximized')
% t = tiledlayout(8,6, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% 
% % plot Gamma
% nexttile(1,[8 1])
% % figure('Position',[10 10 300 750]); 
% plot(Gamma_Robertson, Depth, 'b'); hold on;                     plot(Gamma_median_Robertson, Depth, '--b'); hold on;                    plot(Gamma_Mayne, Depth, 'r'); hold on;                     plot(Gamma_median_Mayne, Depth, '--r'); hold off;                       set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\gamma_{depth} (kN/m^3)', 'fontsize',10);               ylabel('Depth (m)', 'fontsize',10);     legend('\gamma_{Robertson & Cabal (2010)}','\gamma_{median, Robertson & Cabal (2010)}','\gamma_{Mayne et al. (2010)}','\gamma_{median, Mayne et al. (2010)}', 'Location','northwest');                                                                                                                  grid on
% 
% % plot sigmav0 & sigmaPrimev0
% nexttile(2,[8 1])
% plot(sigmav0_Robertson,      Depth, 'b'); hold on;              plot(sigmav0_median_Robertson,      Depth, '--b'); hold on;             plot(sigmav0_Mayne,      Depth, 'r'); hold on;              plot(sigmav0_median_Mayne,      Depth, '--r'); hold off;                set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\sigma_{v0} (kPa)',        'fontsize',10);              ylabel('Depth (m)', 'fontsize',10);     legend('\sigma_{v0}_{ Robertson & Cabal (2010)}',       '\sigma_{v0}_{ median,Robertson & Cabal (2010)}',       '\sigma_{v0}_{ Mayne et al. (2010)}',       '\sigma_{v0}_{ median,Mayne et al. (2010)}',        'Location','northwest');                                                                grid on
% plot(sigmaPrimev0_Robertson, Depth, 'b'); hold on;              plot(sigmaPrimev0_median_Robertson, Depth, '--b'); hold on;             plot(sigmaPrimev0_Mayne, Depth, 'r'); hold on;              plot(sigmaPrimev0_median_Mayne, Depth, '--r'); hold off;                set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\sigma^\prime_{v0} (kPa)', 'fontsize',10);              ylabel('Depth (m)', 'fontsize',10);     legend('\sigma^\prime_{v0}_{ Robertson & Cabal (2010)}','\sigma^\prime_{v0}_{ median,Robertson & Cabal (2010)}','\sigma^\prime_{v0}_{ Mayne et al. (2010)}','\sigma^\prime_{v0}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                grid on
% 
% % plot Qt
% nexttile(3,[8 1])
% semilogx(Q_Robertson, Depth, 'b'); hold on;                     semilogx(Q_median_Robertson, Depth, '--b'); hold on;                    semilogx(Q_Mayne, Depth, 'r'); hold on;                     semilogx(Q_median_Mayne, Depth, '--r'); hold off;                       set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\it{Q_t}', 'fontsize',10);                              ylabel('Depth (m)', 'fontsize',10);     legend('\it{Q_t}_{ Robertson & Cabal (2010)}','\it{Q_t}_{ median,Robertson & Cabal (2010)}','\it{Q_t}_{ Mayne et al. (2010)}','\it{Q_t}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on
% 
% % plot Fr
% nexttile(4,[8 1])
% semilogx(Fr_Robertson, Depth, 'b'); hold on;                    semilogx(Fr_median_Robertson, Depth, '--b'); hold on;                   semilogx(Fr_Mayne, Depth, 'r'); hold on;                    semilogx(Fr_median_Mayne, Depth, '--r'); hold off;                      set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\it{F_r (%)}', 'fontsize',10);                          ylabel('Depth (m)', 'fontsize',10);     legend('\it{F_r}_{ Robertson & Cabal (2010)}','\it{F_r}_{ median,Robertson & Cabal (2010)}','\it{F_r}_{ Mayne et al. (2010)}','\it{F_r}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on
% 
% % plot Bq
% nexttile(5,[8 1])
% plot(Bq_Robertson, Depth, 'b'); hold on;                        plot(Bq_median_Robertson, Depth, '--b'); hold on;                       plot(Bq_Mayne, Depth, 'r'); hold on;                        plot(Bq_median_Mayne, Depth, '--r'); hold off;                          set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\it{B_q}', 'fontsize',10);                              ylabel('Depth (m)', 'fontsize',10);     legend('\it{B_q}_{ Robertson & Cabal (2010)}','\it{B_q}_{ median,Robertson & Cabal (2010)}','\it{B_q}_{ Mayne et al. (2010)}','\it{B_q}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on
% 
% % plot Deltau2ToSigmaPrimeV0
% nexttile(6,[8 1])
% plot(Deltau2ToSigmaPrimeV0_Robertson, Depth, 'b'); hold on;     plot(Deltau2ToSigmaPrimeV0_median_Robertson, Depth, '--b'); hold on;    plot(Deltau2ToSigmaPrimeV0_Mayne, Depth, 'r'); hold on;     plot(Deltau2ToSigmaPrimeV0_median_Mayne, Depth, '--r'); hold off;       set(gca, 'YDir','reverse', 'fontname','times');     xlabel('\it{\Deltau_2/\sigma^\prime_{v0}}', 'fontsize',10);     ylabel('Depth (m)', 'fontsize',10);     legend('\it{\Deltau_2/\sigma^\prime_{v0}}_{ Robertson & Cabal (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ median,Robertson & Cabal (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ Mayne et al. (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ median,Mayne et al. (2010)}', 'Location','northwest');    grid on


% Same figure for PAPER %-------------------------------------------------
figure('Name','Input parameters','WindowState','maximized','Position',[100 100 900 500])
set(gca,'defaulttextinterpreter','latex');
t = tiledlayout(8,6, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'


% plot Gamma
nexttile(1,[8 1])
% figure('Position',[10 10 300 750]); 
plot(Gamma_Robertson, Depth, 'b'); hold on;                     plot(Gamma_median_Robertson, Depth, '--b'); hold on;                    plot(Gamma_Mayne, Depth, 'r'); hold on;                     plot(Gamma_median_Mayne, Depth, '--r'); hold off;                       set(gca, 'YDir','reverse', 'fontname','times');     xlabel('$\gamma \hspace{0.1cm} [kN/m^3]$', 'fontsize',10,'Interpreter','latex');            ylabel('Depth (m)', 'fontsize',10);     grid on %     legend('\gamma_{Robertson & Cabal (2010)}','\gamma_{median, Robertson & Cabal (2010)}','\gamma_{Mayne et al. (2010)}','\gamma_{median, Mayne et al. (2010)}', 'Location','northwest');                                                                                                                  grid on

% plot sigmav0 & sigmaPrimev0
nexttile(2,[8 1])
% plot(sigmav0_Robertson,      Depth, 'b'); hold on;              plot(sigmav0_median_Robertson,      Depth, '--b'); hold on;             plot(sigmav0_Mayne,      Depth, 'r'); hold on;              plot(sigmav0_median_Mayne,      Depth, '--r'); hold off;                set(gca, 'YDir','reverse', 'fontname','times');     xlabel('$\sigma_{v0} \hspace{0.1cm} [kPa]$',        'fontsize',10,'Interpreter','latex');           ylabel('', 'fontsize',10);     legend('\sigma_{v0}_{ Robertson & Cabal (2010)}',       '\sigma_{v0}_{ median,Robertson & Cabal (2010)}',       '\sigma_{v0}_{ Mayne et al. (2010)}',       '\sigma_{v0}_{ median,Mayne et al. (2010)}',        'Location','northwest');                                                                grid on
plot(sigmaPrimev0_Robertson, Depth, 'b'); hold on;              plot(sigmaPrimev0_median_Robertson, Depth, '--b'); hold on;             plot(sigmaPrimev0_Mayne, Depth, 'r'); hold on;              plot(sigmaPrimev0_median_Mayne, Depth, '--r'); hold off;                set(gca, 'YDir','reverse', 'fontname','times');     set(gca,'YTickLabel',[]);       xlabel('$\sigma^\prime_{v0} \hspace{0.1cm} [kPa]$', 'fontsize',10,'Interpreter','latex');           ylabel('', 'fontsize',10);     legend('R. & C.','med., R. & C.','M. et al.','med., M. et al.', 'Location','northeast',"color","none");                                                                grid on

% plot Qt
nexttile(3,[8 1])
semilogx(Q_Robertson, Depth, 'b'); hold on;                     semilogx(Q_median_Robertson, Depth, '--b'); hold on;                    semilogx(Q_Mayne, Depth, 'r'); hold on;                     semilogx(Q_median_Mayne, Depth, '--r'); hold off;                       set(gca, 'YDir','reverse', 'fontname','times');     set(gca,'YTickLabel',[]);       xlabel('$Q_t \hspace{0.1cm} [MPa]$', 'fontsize',10,'Interpreter','latex');                          ylabel('', 'fontsize',10);     grid on % legend('\it{Q_t}_{ Robertson & Cabal (2010)}','\it{Q_t}_{ median,Robertson & Cabal (2010)}','\it{Q_t}_{ Mayne et al. (2010)}','\it{Q_t}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on

% plot Fr
nexttile(4,[8 1])
semilogx(Fr_Robertson, Depth, 'b'); hold on;                    semilogx(Fr_median_Robertson, Depth, '--b'); hold on;                   semilogx(Fr_Mayne, Depth, 'r'); hold on;                    semilogx(Fr_median_Mayne, Depth, '--r'); hold off;                      set(gca, 'YDir','reverse', 'fontname','times');     set(gca,'YTickLabel',[]);       xlabel('$F_r \hspace{0.1cm} [\%]$', 'fontsize',10,'Interpreter','latex');                           ylabel('', 'fontsize',10);     grid on % legend('\it{F_r}_{ Robertson & Cabal (2010)}','\it{F_r}_{ median,Robertson & Cabal (2010)}','\it{F_r}_{ Mayne et al. (2010)}','\it{F_r}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on

% plot Bq
nexttile(5,[8 1])
plot(Bq_Robertson, Depth, 'b'); hold on;                        plot(Bq_median_Robertson, Depth, '--b'); hold on;                       plot(Bq_Mayne, Depth, 'r'); hold on;                        plot(Bq_median_Mayne, Depth, '--r'); hold off;                          set(gca, 'YDir','reverse', 'fontname','times');     set(gca,'YTickLabel',[]);       xlabel('$B_q$', 'fontsize',10,'Interpreter','latex');                                               ylabel('', 'fontsize',10);     grid on % legend('\it{B_q}_{ Robertson & Cabal (2010)}','\it{B_q}_{ median,Robertson & Cabal (2010)}','\it{B_q}_{ Mayne et al. (2010)}','\it{B_q}_{ median,Mayne et al. (2010)}', 'Location','northwest');                                                                                                        grid on

% plot Deltau2ToSigmaPrimeV0
nexttile(6,[8 1])
plot(Deltau2ToSigmaPrimeV0_Robertson, Depth, 'b'); hold on;     plot(Deltau2ToSigmaPrimeV0_median_Robertson, Depth, '--b'); hold on;    plot(Deltau2ToSigmaPrimeV0_Mayne, Depth, 'r'); hold on;     plot(Deltau2ToSigmaPrimeV0_median_Mayne, Depth, '--r'); hold off;       set(gca, 'YDir','reverse', 'fontname','times');     set(gca,'YTickLabel',[]);       xlabel('$\Delta u_2 / \sigma^\prime_{v0}$', 'fontsize',10,'Interpreter','latex');                   ylabel('', 'fontsize',10);     grid on % legend('\it{\Deltau_2/\sigma^\prime_{v0}}_{ Robertson & Cabal (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ median,Robertson & Cabal (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ Mayne et al. (2010)}','\it{\Deltau_2/\sigma^\prime_{v0}}_{ median,Mayne et al. (2010)}', 'Location','northwest');    grid on

%% Save figure
fname = OutputFolder;
filename1 = sprintf('Input params, test_%d', test_number);
res = 300; % resolution
%  saveas(figure(1),fullfile(fname,sprintf(filename1, test_number)));
% exportgraphics(figure(1),fullfile(fname,sprintf('%s%s', filename1, '.png')), 'Resolution',res);
% saveas(figure(1),fullfile(fname,filename1),'epsc');
% saveas(figure(1),fullfile(fname,filename1),'svg');


% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".jpg"), 'Resolution', res);
% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".png"), 'Resolution', res);
% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".tif"), 'Resolution', res);
% print(fullfile(OutputFolder, filename1 + ".svg"), '-dsvg', '-r300');
% print(fullfile(OutputFolder, filename1 + ".eps"), '-depsc', '-r300');
%% Save table
% Fr = Fr1; Q = Q1;
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% % fname = OutputFolder;
% % filename1 = sprintf('Data_from_images-Input %d', test_number);
% % filename2 = sprintf('Data_from_images-3DStratification %d', test_number);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% T = table(Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr, SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt);
% T.Properties.VariableNames = {'Depth' 'sigmaPrimev0' 'sigmav0' 'qc' 'fs'...
%     'qt' 'u2' 'Q_t1' 'Fr' 'SBTsRIGTOSSFrQt' 'SBTsRIGTOSSBqQt' 'SBTsSIGTOSSFrQt' 'SBTsSIGTOSSu2Qt'}; %'z' can be saved under name 'z3D' as well!
% writetable(T,fullfile(fname,(strcat(filename1,'.txt'))),'Delimiter',...
%     '\t','WriteRowNames',true);
%% 
%save figures:
%figure(1)
% saveas(figure(1),fullfile(fname,sprintf('%s_%s_angle%s',filename1,'a','.fig')));
% exportgraphics(figure(1),fullfile(fname,sprintf('%s_%s_angle%s',filename1,'a','.png')), 'Resolution',300);
% saveas(figure(1),fullfile(fname,filename1),'epsc');
% saveas(figure(1),fullfile(fname,filename1),'svg');

% % % %figure(2)
% % % figure(2)
% % % [az, el] = view;% Get azimuth and elevation of current view
% % % az=-0.005;el=87;% Change view of plot
% % % view (az, el)
% % % % Convert current plot view in image (get frame)
% % % saveas(figure(2),fullfile(fname,sprintf('%s_%s_0%s',filename2,'angle','.fig')));
% % % exportgraphics(figure(2),fullfile(fname,sprintf('%s_%s_angle%s',filename2,'a','.png')), 'Resolution',600);
% % % % set(figure(2),'renderer','Painters')
% % % saveas(figure(2),fullfile(fname,filename2),'epsc');
% % % saveas(figure(2),fullfile(fname,filename2),'svg');
% % % 
% % % [az, el] = view;% Get azimuth and elevation of current view
% % % az=-0.005;el=89.999;% Change view of plot
% % % view (az, el)
% % % % Convert current plot view in image (get frame)
% % % saveas(figure(2),fullfile(fname,sprintf('%s_%s_0%s',filename2,'angle90','.fig')));
% % % exportgraphics(figure(2),fullfile(fname,sprintf('%s_%s_angle90%s',filename2,'a','.png')), 'Resolution',600);
% % % % set(figure(2),'renderer','Painters')
% % % saveas(figure(2),fullfile(fname,strcat(filename2,'_angle90')),'epsc');
% % % saveas(figure(2),fullfile(fname,strcat(filename2,'_angle90')),'svg');

end

