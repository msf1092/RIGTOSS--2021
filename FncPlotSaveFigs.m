function FncPlotSaveFigs(CodesFolder, OutputFolder, WTMMFolder, SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt, ...
    Depth, rawQ, rawFr, rawBq, rawDeltau2ToSigmaPrimeV0, ...
    sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q1, Fr1, Bq1, Deltau2ToSigmaPrimeV01, ...
    NormNashDFrQt, NormNashDBqQt, NormNashDSIGTOSSFrQt, NormNashDSIGTOSSu2Qt, test_number)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%% plot SBT before smoothing and -IGTOSS models
% SBT = zeros(length(rawQ),1);
rawQ = log10(rawQ);
rawFr = log10(rawFr);
for i = 1 : length(rawQ)
    e = 1;
    SBT1(i,e) = FncSBTpointsLocatorFrQt(e, rawFr(i), rawQ(i));
    SBT2(i,e) = FncSBTpointsLocatorRobertsonBqQt(e, rawQ(i), rawBq(i));
    SBT3(i,e) = FncSBTpointsLocatorSchneiderFrQt(e, rawFr(i), rawQ(i));
    SBT4(i,e) = FncSBTpointsLocatorSchneideru2Qt(e, rawDeltau2ToSigmaPrimeV0(i), rawQ(i));
end
% figure('Name','Results', 'units','inch', 'Position', [0.1 0.6 15/2.54 10/2.54]) %'WindowState','maximized'
% t = tiledlayout(1,4, 'Padding', 'compact', 'TileSpacing', 'compact');
% nexttile(1); plot(SBT1, Depth, 'Color',[0 0.4470 0.7410]);      xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(2); plot(SBT2, Depth, 'Color',[0.8500 0.3250 0.0980]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[B_q- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(3); plot(SBT3, Depth, 'Color',[0.9290 0.6940 0.1250]); xlim([0 6 ]); xticks([0 1 2 3 4 5 6]);            xticklabels({'','1a','1b','1c/3','2','f',''});                 xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Schneider}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(4); plot(SBT4, Depth, 'Color',[0.4940 0.1840 0.5560]); xlim([0 7 ]); xticks([0 1 2 3 4 5 6 7]);          xticklabels({'','1c','1a/3','1b','3','2','f',''});             xlabel('SBT'); ylabel('Depth (m)'); title('[(\Deltau_2/\sigma^\prime_v_0) - Q_t]_{Schneider}'); set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
%% Article's figure
for i = 1 : length(rawQ)
    e = 1;
    SBT1(i,e) = FncSBTpointsLocatorFrQt(e, rawFr(i), rawQ(i));
    SBT2(i,e) = FncSBTpointsLocatorRobertsonBqQt(e, rawQ(i), rawBq(i));
    SBT3(i,e) = FncSBTpointsLocatorSchneiderFrQt(e, rawFr(i), rawQ(i));
    SBT4(i,e) = FncSBTpointsLocatorSchneideru2Qt(e, rawDeltau2ToSigmaPrimeV0(i), rawQ(i));
end
% figure('Name','Results', 'units','inch', 'Position', [0.1 0.6 15/2.54 10/2.54]) %'WindowState','maximized'
% t = tiledlayout(1,4, 'Padding', 'compact', 'TileSpacing', 'compact');
% nexttile(1); plot(SBT1, Depth, 'Color',[0 0.4470 0.7410]);      xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(2); plot(SBT2, Depth, 'Color',[0.8500 0.3250 0.0980]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[B_q- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(3); plot(SBT3, Depth, 'Color',[0.9290 0.6940 0.1250]); xlim([1 5 ]); xticks([1 2 3 4 5]);            xticklabels({'1a','1b','1c/3','2','f'});                 xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Schneider}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on
% nexttile(4); plot(SBT4, Depth, 'Color',[0.4940 0.1840 0.5560]); xlim([1 6 ]); xticks([1 2 3 4 5 6]);          xticklabels({'1c','1a/3','1b','3','2','f'});             xlabel('SBT'); ylabel('Depth (m)'); title('[(\Deltau_2/\sigma^\prime_v_0) - Q_t]_{Schneider}'); set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8); grid on

%% Normalized N-H Distance plots
% figure('Name','Normalized Nash-Harsanyi Distances', 'units','inch', 'Position', [0.1 0.6 30/2.54 15/2.54]) %'WindowState','maximized'
% t = tiledlayout(4,4, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% 
% NormNashDmat = [NormNashDFrQt, NormNashDBqQt, NormNashDSIGTOSSFrQt, NormNashDSIGTOSSu2Qt];
% A = {'Normalized D_{N-H, RIGTOSS_{F_r-Q_t}}', 'Normalized D_{N-H, RIGTOSS_{B_q-Q_t}}', ...
%     'Normalized D_{N-H, SIGTOSS_{F_r-Q_t}}', 'Normalized D_{N-H, SIGTOSS_{(\Deltau_2/\sigma^\prime_{v0}) - Q_t}}'};
% for j = 1:4
%     nexttile(j,[4 1])
%     NormNashDFrQt = NormNashDmat(:,j);
%     FncPlotNormNashDAlphaCutsDist(NormNashDFrQt, Depth, j, A{j});
% end
%% All plots (point red on characterization charts)

% figure('Name','Results','WindowState','maximized')
% t = tiledlayout(8,18, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% 
% % plot qc
% nexttile(1,[8 1])
% FncPlotqc(qc, Depth);      set(gca,'Ydir','reverse')
% 
% % plot Q
% nexttile(2,[8 1])
% FncPlotQ(Q1, Depth);       set(gca,'Ydir','reverse')
% 
% % plot fs
% nexttile(3,[8 1])
% FncPlotfs(fs, Depth);      set(gca,'Ydir','reverse')
% 
% % plot Fr
% nexttile(4,[8 1])
% FncPlotFr(Fr1, Depth);     set(gca,'Ydir','reverse')
% 
% % plot D_{N-H}
% nexttile(5,[8 1])
% FncPlotDNH(NormNashDFrQt, Depth);     set(gca,'Ydir','reverse')
% 
% % plot Ic
% nexttile(6,[8 1])
% FncPlotIc(Q1, Fr1, Depth); set(gca,'Ydir','reverse')
% 
% % plot WTMM stratification
% try
%     nexttile(7,[8 1])
%     FncPlotWTMMStratification(Q1, Fr1, Depth);     set(gca,'Ydir','reverse')
% catch
%     disp('WTMM method could not be run!');
% end
% 
% % 3D stratification, based on Fr-Qt of Robertson
% nexttile(8,[8 2])
% cd(CodesFolder)
% z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth);
% 
% % 3D stratification, based on Bq-Qt of Robertson
% nexttile(10,[8 2])
% cd(CodesFolder)
% z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth);
% 
% % plot Schneider's chart, based on Fr-Q of Schneider
% nexttile(12,[8 2])
% z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth);
% 
% % plot Schneider's chart, based on Delta(u2)-Q of Schneider
% nexttile(14,[8 2])
% z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth);
% 
% % plot Fr-Qt Robertson chart
% nexttile(16,[2 3])
% FncPlotRobertsonFrQt(Q1, Fr1)
% 
% % plot Bq-Qt Robertson chart
% nexttile(52,[2 3])
% FncPlotRobertsonBqQt(Q1, Bq1)
% 
% % plot Fr-Q Schneider chart
% nexttile(88,[2 3])
% FncPlotSchneiderFrQt(Q1, Fr1)
% 
% % plot Delta(u2)-Q Schneider chart
% nexttile(124,[2 3])
% FncPlotSchneideru2Qt(Q1, Deltau2ToSigmaPrimeV01)

%% All plots, with fading markers on charts

figure('Name','Results', 'units','inch', 'Position',[0.1 0.6 19/2.54 14/2.54]) %'WindowState','maximized')
t = tiledlayout(8,18, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'

% plot qc
nexttile(1,[8 1])
FncPlotqc(qc, Depth);      set(gca,'Ydir','reverse')

% plot Q
nexttile(2,[8 1])
FncPlotQ(Q1, Depth);       set(gca,'Ydir','reverse')

% plot fs
nexttile(3,[8 1])
FncPlotfs(fs, Depth);      set(gca,'Ydir','reverse')

% plot Fr
nexttile(4,[8 1])
FncPlotFr(Fr1, Depth);     set(gca,'Ydir','reverse')

% plot D_{N-H}
nexttile(5,[8 1])
FncPlotDNH(NormNashDFrQt, Depth);     set(gca,'Ydir','reverse')

% plot Ic
nexttile(6,[8 1])
FncPlotIc(Q1, Fr1, Depth); set(gca,'Ydir','reverse')

% plot WTMM stratification
try
    nexttile(7,[8 1])
    FncPlotWTMMStratification(Q1, Fr1, Depth);     set(gca,'Ydir','reverse')
catch
    disp('WTMM method could not be run!');
end

% 3D stratification, based on Fr-Qt of Robertson
nexttile(8,[8 2])
cd(CodesFolder)
z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth); xlim([1 10]); xticks([0 1 2 3 4 5 6 7 8 9 10]); xticklabels({'','1','2','3','4','5','6','7','8','9','f'});

% 3D stratification, based on Bq-Qt of Robertson
nexttile(10,[8 2])
cd(CodesFolder)
z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth); xlim([1 10]); xticks([0 1 2 3 4 5 6 7 8 9 10]); xticklabels({'','1','2','3','4','5','6','7','8','9','f'});

% plot Schneider's chart, based on Fr-Q of Schneider
nexttile(12,[8 2])
z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth); xlim([0 6 ]); xticks([0 1 2 3 4 5]);          xticklabels({'','1a','1b','1c/3','2','f',''});          

% plot Schneider's chart, based on Delta(u2)-Q of Schneider
nexttile(14,[8 2])
z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth); xlim([0 7 ]); xticks([0 1 2 3 4 5 6]);        xticklabels({'','1c','1a/3','1b','3','2','f',''});       

% % plot Fr-Qt Robertson chart
% nexttile(16,[2 3])
% FncPlotRobertsonFrQtColor(Q1, Fr1)
% 
% % plot Bq-Qt Robertson chart
% nexttile(52,[2 3])
% FncPlotRobertsonBqQtColor(Q1, Bq1)
% 
% % plot Fr-Q Schneider chart
% nexttile(88,[2 3])
% FncPlotSchneiderFrQtColor(Q1, Fr1)
% 
% % plot Delta(u2)-Q Schneider chart
% nexttile(124,[2 3])
% FncPlotSchneideru2QtColor(Q1, Deltau2ToSigmaPrimeV01)

Spacing = length(Depth); %100; %the number of points to be plotted in each step

for i = 1 : Spacing : length(Depth)
    nexttile(8,[8 2])
    hold on 
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(10,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(12,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(14,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    % plot Fr-Qt Robertson chart
    nexttile(16,[2 3])
    FncPlotRobertsonFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
    
    % plot Bq-Qt Robertson chart
    nexttile(52,[2 3])
    FncPlotRobertsonBqQtColor( Q1(a:b,1), Bq1(a:b,1) )
    
    % plot Fr-Q Schneider chart
    nexttile(88,[2 3])
    FncPlotSchneiderFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
    
    % plot Delta(u2)-Q Schneider chart
    nexttile(124,[2 3])
    FncPlotSchneideru2QtColor( Q1(a:b,1), Deltau2ToSigmaPrimeV01(a:b,1) )
    
    pause()
end
%% plots For FIRI application, Clustered colored points on Robertson chart

% figure('Name','Results', 'units','inch', 'Position',[0.1 0.6 9/2.54 11/2.54]) %'WindowState','maximized')
% t = tiledlayout(8,5, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% 
% % plot qc
% nexttile(1,[8 1])
% FncPlotqc(qc, Depth);      set(gca,'Ydir','reverse');   set(gca,'title',[]);
% 
% % plot fs
% nexttile(2,[8 1])
% FncPlotfs(fs, Depth);      set(gca,'Ydir','reverse');   set(gca,'title',[]);
% 
% % plot u2
% nexttile(3,[8 1])
% FncPlotu2(u2, Depth);      set(gca,'Ydir','reverse');   set(gca,'title',[]);
% 
% % 3D stratification, based on Fr-Qt of Robertson
% nexttile(4,[8 2])
% cd(CodesFolder)
% z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth); xlim([1 10]); xticks([0 1 2 3 4 5 6 7 8 9 10]); xticklabels({'','1','2','3','4','5','6','7','8','9','f'}); set(gca,'YTickLabel',[]); xlabel('SBT'); grid on


figure('Name','Results', 'units','inch', 'Position',[0.1 0.6 6.5/2.54 6.5/2.54]) %'WindowState','maximized')
Spacing = length(Depth); %100; %the number of points to be plotted in each step

for i = 1 : Spacing : length(Depth)
    nexttile(8,[8 2])
    hold on 
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(10,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(12,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(14,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    % plot Fr-Qt Robertson chart
    nexttile(16,[2 3])
    FncPlotRobertsonFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
    
    pause()
end

% OutputFolder = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Desktop\TEMP\FIRI_figures_CPTu\Ulvila, Haistila';
% fname = OutputFolder;
% filename1 = sprintf('Strat, test_%d', test_number);
% exportgraphics(figure(5),fullfile(fname,sprintf('%s%s', filename1, '.png')), 'Resolution',600);
% pause()
% filename1 = sprintf('Robert, test_%d', test_number);
% exportgraphics(figure(6),fullfile(fname,sprintf('%s%s', filename1, '.png')), 'Resolution',600);
%% Stratification profiles: RIGTOSS & SIGTOSS & Charts
% 
% figure('Name','Stratification profiles','WindowState','maximized')
% t = tiledlayout(8,11, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% 
% % A) Stratification profiles:
% 
% % 3D stratification, based on Fr-Qt of Robertson
% nexttile(1,[8 2])
% z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth);     set(gca, 'fontname','times')
% 
% % 3D stratification, based on Bq-Qt of Robertson
% nexttile(3,[8 2])
% z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth);     set(gca, 'fontname','times')
% 
% % plot Schneider's chart, based on Fr-Q of Schneider
% nexttile(5,[8 2])
% z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth);     set(gca, 'fontname','times')
% 
% % plot Schneider's chart, based on Delta(u2)-Q of Schneider
% nexttile(7,[8 2])
% z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth);     set(gca, 'fontname','times')
% 
% % B) Charts:
% 
% % plot Fr-Qt Robertson chart
% nexttile(9,[2 3])
% FncPlotRobertsonFrQt(Q1, Fr1);                                  set(gca, 'fontname','times')
% 
% % plot Bq-Qt Robertson chart
% nexttile(31,[2 3])
% FncPlotRobertsonBqQt(Q1, Bq1);                                  set(gca, 'fontname','times')
% 
% % plot Fr-Q Schneider chart
% nexttile(53,[2 3])
% FncPlotSchneiderFrQt(Q1, Fr1);                                  set(gca, 'fontname','times')
% 
% % plot Delta(u2)-Q Schneider chart
% nexttile(75,[2 3])
% FncPlotSchneideru2Qt(Q1, Deltau2ToSigmaPrimeV01);               set(gca, 'fontname','times')


%% Save figures
% fname = OutputFolder;
% filename1 = sprintf('Smoothed inputs, test_%d', test_number);
% exportgraphics(figure(1),fullfile(fname,sprintf('%s%s', filename1, '.png')), 'Resolution',600);
% 
% filename2 = sprintf('Interpreted parameters, test_%d', test_number);
% exportgraphics(figure(5),fullfile(fname,sprintf('%s%s', filename2, '.png')), 'Resolution',600);
% 
% filename3 = sprintf('Alpha-cuts, test_%d', test_number);
% exportgraphics(figure(2),fullfile(fname,sprintf('%s%s', filename3, '.png')), 'Resolution',600);
% 
% filename4 = sprintf('Output, RIGTOSS_SIGTOSS_WTMM, test_%d', test_number);
% exportgraphics(figure(3),fullfile(fname,sprintf('%s%s', filename4, '.png')), 'Resolution',600);
% 
% filename5 = sprintf('Output, RIGTOSS_SIGTOSS, test_%d', test_number);
% exportgraphics(figure(4),fullfile(fname,sprintf('%s%s', filename5, '.png')), 'Resolution',600);

%  saveas(figure(2),fullfile(fname,sprintf(filename1, test_number)));
% saveas(figure(3),fullfile(fname,filename1),'epsc');
% saveas(figure(3),fullfile(fname,filename1),'svg');


%% Save table
Fr = Fr1; Q = Q1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fname = OutputFolder;
% filename1 = sprintf('Data_from_images-Input %d', test_number);
% filename2 = sprintf('Data_from_images-3DStratification %d', test_number);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% T = table(Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr, SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt);
% T.Properties.VariableNames = {'Depth' 'sigmaPrimev0' 'sigmav0' 'qc' 'fs'...
%     'qt' 'u2' 'Q_t1' 'Fr' 'SBTsRIGTOSSFrQt' 'SBTsRIGTOSSBqQt' 'SBTsSIGTOSSFrQt' 'SBTsSIGTOSSu2Qt'}; %'z' can be saved under name 'z3D' as well!
% writetable(T,fullfile(fname,(strcat(filename1,'.txt'))),'Delimiter',...
%     '\t','WriteRowNames',true);
%% Check plot
% Spacing = length(Depth); %100; %the number of points to be plotted in each step
% 
% figure('Name','Results', 'units','inch', 'Position',[0.1 0.6 19/2.54 14/2.54]) %'WindowState','maximized')
% t = tiledlayout(8,11, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
% nexttile(1,[8 2]) % 3D stratification, based on Fr-Qt of Robertson
% z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth); hold on; plot3(SBT1, Depth, ones(length(Depth),1), 'Color',[1 0.8 1]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8);
% nexttile(3,[8 2]) % 3D stratification, based on Bq-Qt of Robertson
% z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth); hold on; plot3(SBT2, Depth, ones(length(Depth),1), 'Color',[1 0.8 1]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT'); ylabel('Depth (m)'); title('[B_q- Q_t]_{Robertson}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8);
% % plot Schneider's chart, based on Fr-Q of Schneider
% nexttile(5,[8 2])
% z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth); hold on; plot3(SBT3, Depth, ones(length(Depth),1), 'Color',[1 0.8 1]); xlim([0 6 ]); xticks([0 1 2 3 4 5]);          xticklabels({'','1a','1b','1c/3','2','f',''});                 xlabel('SBT'); ylabel('Depth (m)'); title('[F_r- Q_t]_{Schneider}');                           set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8);
% % plot Schneider's chart, based on Delta(u2)-Q of Schneider
% nexttile(7,[8 2])
% z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth); hold on; plot3(SBT4, Depth, ones(length(Depth),1), 'Color',[1 0.8 1]); xlim([0 7 ]); xticks([0 1 2 3 4 5 6]);        xticklabels({'','1c','1a/3','1b','3','2','f',''});             xlabel('SBT'); ylabel('Depth (m)'); title('[(\Deltau_2/\sigma^\prime_v_0) - Q_t]_{Schneider}'); set(gca, 'Ydir','reverse', 'fontName','times', 'fontSize',8);
% hold on
% for i = 1 : Spacing : length(Depth)
%     nexttile(1,[8 2])
%     hold on 
%     a = i;              b = i + Spacing - 1
%     x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(3,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(5,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(7,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     % plot Fr-Qt Robertson chart
%     nexttile(9,[2 3])
%     FncPlotRobertsonFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
%     
%     % plot Bq-Qt Robertson chart
%     nexttile(31,[2 3])
%     FncPlotRobertsonBqQtColor( Q1(a:b,1), Bq1(a:b,1) )
%     
%     % plot Fr-Q Schneider chart
%     nexttile(53,[2 3])
%     FncPlotSchneiderFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
%     
%     % plot Delta(u2)-Q Schneider chart
%     nexttile(75,[2 3])
%     FncPlotSchneideru2QtColor( Q1(a:b,1), Deltau2ToSigmaPrimeV01(a:b,1) )
%     
% %     pause()
% end
% save
% filename6 = sprintf('Output, RIGTOSS_SIGTOSS_colored, test_%d', test_number);
% exportgraphics(figure(6),fullfile(fname,sprintf('%s%s', filename6, '.png')), 'Resolution',600);
%% Article figure (Check plot) --> without solid line from direct usage of charts
Spacing = length(Depth); %the number of points to be plotted in each step

figure('Name','Charts vs. -IGTOSS', 'units','centimeters', 'Position',[1 2 13.0 10.0])%'WindowState','maximized')
set(gca,'defaulttextinterpreter','latex');
t = tiledlayout(8,8, 'Padding', 'compact', 'TileSpacing', 'compact'); %'TileSpacing', 'compact'
nexttile(1,[8 2]) % 3D stratification, based on Fr-Qt of Robertson
z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth); set(gca,'defaulttextinterpreter','latex');
set(gca,                  'fontName','times', 'fontSize',8); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT','Interpreter','latex');	%hold on; plot3(SBT1, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
nexttile(3,[8 2]) % 3D stratification, based on Bq-Qt of Robertson
z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth); set(gca,'defaulttextinterpreter','latex');
set(gca, 'YTickLabel',[], 'fontName','times', 'fontSize',8); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT','Interpreter','latex');	%hold on; plot3(SBT2, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% plot Schneider's chart, based on Fr-Q of Schneider
nexttile(5,[8 2])
z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth); set(gca,'defaulttextinterpreter','latex');
set(gca, 'YTickLabel',[], 'fontName','times', 'fontSize',8); xlim([1 5 ]); xticks([1 2 3 4 5]);            xticklabels({'1a','1b','1c/3','2','f'});                 xlabel('SBT','Interpreter','latex');	%hold on; plot3(SBT3, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 5 ]); xticks([1 2 3 4 5]);            xticklabels({'1a','1b','1c/3','2','f'});                 xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% plot Schneider's chart, based on Delta(u2)-Q of Schneider
nexttile(7,[8 2])
z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth); set(gca,'defaulttextinterpreter','latex');
set(gca, 'YTickLabel',[], 'fontName','times', 'fontSize',8); xlim([1 6 ]); xticks([1 2 3 4 5 6]);          xticklabels({'1c','1a/3','1b','3','2','f'});             xlabel('SBT','Interpreter','latex');	%hold on; plot3(SBT4, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 6 ]); xticks([1 2 3 4 5 6]);          xticklabels({'1c','1a/3','1b','3','2','f'});             xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
hold on
for i = 1 : Spacing : length(Depth)
    nexttile(1,[8 2])
    hold on 
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(3,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(5,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
    
    nexttile(7,[8 2])
    hold on
    a = i;              b = i + Spacing - 1;
    x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
    plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
end

fname = OutputFolder;
filename1 = sprintf('Stratification_profiles, test_%d', test_number);
res = 300; % resolution
% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".jpg"), 'Resolution', res);
% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".png"), 'Resolution', res);
% exportgraphics(gcf, fullfile(OutputFolder, filename1 + ".tif"), 'Resolution', res);
% print(fullfile(OutputFolder, filename1 + ".svg"), '-dsvg', '-r300');
% print(fullfile(OutputFolder, filename1 + ".eps"), '-depsc', '-r300');
%% Points on each characterization chart + GMM-based PDFs

% RIGTOSS_Fr
% Enter the layer change depths:
% ch_d = [1.6; 3.4; 4.53; 7.14; 8.52]; % CP030-R&C
ch_d = [2.78; 4.07; 5.10; 6.69]; % CP030-Mayne
% Function to draw the figure
FncPlotRobertsonFrQtColorGMM( Depth, Q1(a:b,1), Fr1(a:b,1), ch_d )
% Save the figure
filename1 = sprintf('Robertson Fr chart-PDF-layers, test_%d', test_number);
res = 300; % resolution
FncSaveFormats(OutputFolder,filename1,res)

% RIGTOSS_Bq
% Enter the layer change depths:
% ch_d = [2.84; 4.55; 5.37; 7.16; 8.48]; % CP030-R&C
ch_d = [2.83; 4.55; 5.40; 6.99; 8.52]; % CP030-Mayne
% Function to draw the figure
FncPlotRobertsonBqQtColorGMM(Depth, Q1, Bq1, ch_d)
% Save the figure
filename1 = sprintf('Robertson Bq chart-PDF-layers, test_%d', test_number);
res = 300; % resolution
FncSaveFormats(OutputFolder,filename1,res)

% SIGTOSS_Fr
% Enter the layer change depths:
% ch_d = [2.71; 4.56; 7.14; 8.51]; % CP030-R&C
ch_d = [4.20; 5.01; 5.25; 6.46; 6.69]; % CP030-Mayne
% Function to draw the figure
FncPlotSchneiderFrQtColorGMM( Depth, Q1, Fr1, ch_d )
% Save the figure
filename1 = sprintf('Schneider Fr chart-PDF-layers, test_%d', test_number);
res = 300; % resolution
FncSaveFormats(OutputFolder,filename1,res)

% SIGTOSS_u2
% Enter the layer change depths:
% ch_d = [2.85; 5.21; 6.73; 8.95]; % CP030-R&C
ch_d = [3.30; 5.37; 5.82; 6.57]; % CP030-Mayne
% Function to draw the figure
FncPlotSchneideru2QtColorGMM( Depth, Q1, Deltau2ToSigmaPrimeV01, ch_d )
% Save the figure
filename1 = sprintf('Shneider u2 chart-PDF-layers, test_%d', test_number);
res = 300; % resolution
FncSaveFormats(OutputFolder,filename1,res)


%% Points on each characterization chart (colored with depth)
figure('Name','Charts', 'units','centimeters', 'Position',[1 2 4.5 13.0])%'WindowState','maximized')
t = tiledlayout(8,3, 'Padding', 'compact', 'TileSpacing', 'none'); %'TileSpacing', 'compact'
for i = 1 : Spacing : length(Depth)
    % plot Fr-Qt Robertson chart
    nexttile(1,[2 3])
    FncPlotRobertsonFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
    % plot Bq-Qt Robertson chart
    nexttile(7,[2 3])
    FncPlotRobertsonBqQtColor( Q1(a:b,1), Bq1(a:b,1) )
    % plot Fr-Q Schneider chart
    nexttile(13,[2 3])
    FncPlotSchneiderFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
    % plot Delta(u2)-Q Schneider chart
    nexttile(19,[2 3])
    FncPlotSchneideru2QtColor( Q1(a:b,1), Deltau2ToSigmaPrimeV01(a:b,1) )
end

% save
% filename1 = sprintf('-IGTOSS, CPTu11');
% exportgraphics(figure(1),fullfile(sprintf('%s%s', filename1, '.png')), 'Resolution',900);
%% Article figure (Check plot) --> with solid line from direct usage of charts
% Spacing = length(Depth); %the number of points to be plotted in each step
% 
% figure('Name','Charts vs. -IGTOSS', 'units','centimeters', 'Position',[1 2 10.0 13.0])%'WindowState','maximized')
% t = tiledlayout(8,8, 'Padding', 'compact', 'TileSpacing', 'none'); %'TileSpacing', 'compact'
% nexttile(1,[8 2]) % 3D stratification, based on Fr-Qt of Robertson
% z = Fnc3DStratificationRIGTOSSFrQt(SBTsRIGTOSSFrQt, Depth); hold on; plot3(SBT1, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% nexttile(3,[8 2]) % 3D stratification, based on Bq-Qt of Robertson
% z = Fnc3DStratificationRIGTOSSBqQt(SBTsRIGTOSSBqQt, Depth); hold on; plot3(SBT2, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 10]); xticks([1 2 3 4 5 6 7 8 9 10]); xticklabels({'1','2','3','4','5','6','7','8','9','10'}); xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% % plot Schneider's chart, based on Fr-Q of Schneider
% nexttile(5,[8 2])
% z = Fnc3DStratificationSIGTOSSFrQt(SBTsSIGTOSSFrQt, Depth); hold on; plot3(SBT3, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 5 ]); xticks([1 2 3 4 5]);            xticklabels({'1a','1b','1c/3','2','f'});                 xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% % plot Schneider's chart, based on Delta(u2)-Q of Schneider
% nexttile(7,[8 2])
% z = Fnc3DStratificationSIGTOSSu2Qt(SBTsSIGTOSSu2Qt, Depth); hold on; plot3(SBT4, Depth, ones(length(Depth),1), 'Color',[1 0.0 0]); xlim([1 6 ]); xticks([1 2 3 4 5 6]);          xticklabels({'1c','1a/3','1b','3','2','f'});             xlabel('SBT');	set(gca, 'Ydir','reverse', 'YTickLabel',[], 'fontName','times', 'fontSize',8);
% hold on
% for i = 1 : Spacing : length(Depth)
%     nexttile(1,[8 2])
%     hold on 
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(3,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 10];     y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(5,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
%     
%     nexttile(7,[8 2])
%     hold on
%     a = i;              b = i + Spacing - 1;
%     x_val = [0 6];      y_val1 = [Depth(a) Depth(a)];      y_val2 = [Depth(b) Depth(b)];
%     plot(x_val,y_val1, 'c', 'LineWidth',1);                plot(x_val,y_val2, 'c', 'LineWidth',1); 
% end
% 
% figure('Name','Charts', 'units','centimeters', 'Position',[1 2 4.5 13.0])%'WindowState','maximized')
% t = tiledlayout(8,3, 'Padding', 'compact', 'TileSpacing', 'none'); %'TileSpacing', 'compact'
% for i = 1 : Spacing : length(Depth)
%     % plot Fr-Qt Robertson chart
%     nexttile(1,[2 3])
%     FncPlotRobertsonFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
%     % plot Bq-Qt Robertson chart
%     nexttile(7,[2 3])
%     FncPlotRobertsonBqQtColor( Q1(a:b,1), Bq1(a:b,1) )
%     % plot Fr-Q Schneider chart
%     nexttile(13,[2 3])
%     FncPlotSchneiderFrQtColor( Q1(a:b,1), Fr1(a:b,1) )
%     % plot Delta(u2)-Q Schneider chart
%     nexttile(19,[2 3])
%     FncPlotSchneideru2QtColor( Q1(a:b,1), Deltau2ToSigmaPrimeV01(a:b,1) )
% end
% 
% % save
% filename1 = sprintf('-IGTOSS, CPTu14');
% exportgraphics(figure(1),fullfile(sprintf('%s%s', filename1, '.png')), 'Resolution',900);
% filename2 = sprintf('Datapoints on charts, CPTu14');
% exportgraphics(figure(2),fullfile(sprintf('%s%s', filename2, '.png')), 'Resolution',900);
end

