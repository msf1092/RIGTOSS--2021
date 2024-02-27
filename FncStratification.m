function [SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt, ...
    Fr1, Q1, Bq1, Deltau2ToSigmaPrimeV01] = ...
    FncStratification(CodesFolder, Depth, sigmaPrimev0, sigmav0, ...
    qc, fs, qt, u2, Q, Fr, Bq, Deltau2ToSigmaPrimeV0, test_number)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%% Turn warnings 'off'
% warning('off','all')
% warning
%% Output folder location:
OutputFolder = fullfile(CodesFolder,'Output');
%% Save input Q & Fr, to be used in figures
rawQ = Q;   rawFr = Fr;     rawBq = Bq;     rawDeltau2ToSigmaPrimeV0 = Deltau2ToSigmaPrimeV0;
%% Smoothing & Plotting the measured Fr and Q
% remInd = find( Depth < Depth(1,1) );
% Depth([remInd],:) = []; sigmaPrimev0([remInd],:) = []; sigmav0([remInd],:) = [];
% qc([remInd],:) = []; fs([remInd],:) = []; qt([remInd],:) = [];  u2([remInd],:) = [];
% Q([remInd],:) = []; Fr([remInd],:) = [];

% Smoothing the data to remove outliers negative effect:
Fr1 =                    smooth(Depth, Fr,                    0.01, 'loess');
Q1  =                    smooth(Depth, Q,                     0.01, 'loess');
Bq1 =                    smooth(Depth, Bq,                    0.01, 'loess');
Deltau2ToSigmaPrimeV01 = smooth(Depth, Deltau2ToSigmaPrimeV0, 0.01, 'loess');
% Plotting the smoothed vs. measured Fr and Q
% FncPlotSmoothedFrQ(OutputFolder, Depth, Fr, Q, Fr1, Q1, Bq, Bq1, Deltau2ToSigmaPrimeV0, Deltau2ToSigmaPrimeV01, test_number)

Fr = Fr1;   Q = Q1;     Bq = Bq1;   Deltau2ToSigmaPrimeV0 = Deltau2ToSigmaPrimeV01;
%% Stratification based on Fr-Qt chart of Robertson (1990):
[SBTsRIGTOSSFrQt, NormNashDFrQt]        = FncRIGTOSSFrQt(Depth, Q, Fr);

%% Stratification based on Bq-Qt chart of Robertson (1990):
[SBTsRIGTOSSBqQt, NormNashDBqQt]        = FncRIGTOSSBqQt(Depth, Q, Bq);

%% Stratification based on Fr-Qt chart of Schneider (2012):
[SBTsSIGTOSSFrQt, NormNashDSIGTOSSFrQt] = FncSIGTOSSFrQt(Depth, Q, Fr);

%% Stratification based on u2-Qt chart of Schneider (2012):
[SBTsSIGTOSSu2Qt, NormNashDSIGTOSSu2Qt] = FncSIGTOSSu2Qt(Depth, Q, Deltau2ToSigmaPrimeV0);

%% Plots and saving results:
WTMMFolder = fullfile(OutputFolder,'WTMM-Ching et al 2015');
FncPlotSaveFigs(CodesFolder, OutputFolder, WTMMFolder, SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt, ...
    Depth, rawQ, rawFr, rawBq, rawDeltau2ToSigmaPrimeV0, ...
    sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q1, Fr1, Bq1, Deltau2ToSigmaPrimeV01, ...
    NormNashDFrQt, NormNashDBqQt, NormNashDSIGTOSSFrQt, NormNashDSIGTOSSu2Qt, test_number)
end
