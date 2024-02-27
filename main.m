clear; close all; format compact; clc
%% Loading required data which are 'Depth', 'Fr', and 'Q':
%Load data from Laura's database:
% Enter the main folder containing subfolders of 'stress-strain' and 'index properties' data!
dataFolder = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\(R-S)IGTOSS_analysis\Data';
Depth_wat = 0.5;

XLfiles = dir(fullfile(dataFolder, '*.xlsx'));  

for i = 10 : 10 % length(XLfiles)
    close all
    try
        %% Read data
        CodesFolder = 'C:\Users\qdmofa\OneDrive - TUNI.fi\Fincone II-adjunct\Asli\FINCONE II - Analytical tools\Codes\(R-S)IGTOSS_analysis\Code'; % Used to save input params charts
        [Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr, Bq, Deltau2ToSigmaPrimeV0] = ...
            FncReadDataJS(dataFolder, CodesFolder, XLfiles, i, Depth_wat); % 'i' is used as 'test_number' in the functions
        %% Stratification
        [SBTsRIGTOSSFrQt, SBTsRIGTOSSBqQt, SBTsSIGTOSSFrQt, SBTsSIGTOSSu2Qt, Fr1, Q1, Bq1, Deltau2ToSigmaPrimeV01] = ...
            FncStratification(CodesFolder, Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr, Bq, Deltau2ToSigmaPrimeV0, i); % 'i' is used as 'test_number' in the functions
    catch
        %Nothing to do
    end
end

%% Geographic zone
% latSeattle = 36.0144;
% lonSeattle = 6.0304;
% latAnchorage = 47.0733;
% lonAnchorage = 17.2815;
% geoplot([latSeattle latAnchorage],[lonSeattle lonAnchorage])
% geolimits([36.0144 47.0733],[6.0304 17.2815])
% geobasemap colorterrain
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Description %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code structure and the funcitons are arranged as:

%main.m
%   FncReadDataJS.m
%       FncPreprocessData.m
%           FncUserDefinedGamma.m
%           FncNktLow.m                         Not completed yet!!!
%           FncPlotSaveInputsCharts.m
%   FncStratification.m
%       FncPlotSmoothedFrQ.m                    Smoothing Fr & Q & Bq & Deltau2ToSigmaPrimeV0!
%       FncRIGTOSSFrQt.m
%           FncSBTpointsLocatorFrQt.m           Points on Fr-Qt Robertson chart!
%               FncAlphaCutDist.m
%       FncRIGTOSSBqQt.m
%           FncSBTpointsLocatorRobertsonBqQt.m  Points on Bq-Qt Robertson chart!
%               FncAlphaCutDist.m
%       FncSIGTOSSFrQt.m
%           FncSBTpointsLocatorSchneiderFrQt.m  Points on Fr-Qt Schneider chart!
%               FncAlphaCutDist.m
%       FncSIGTOSSu2Qt.m
%           FncSBTpointsLocatorSchneideru2Qt.m  Points on u2-Qt Schneider chart!
%               FncAlphaCutDist.m
%       FncPlotSaveFigs.m                       Plots!
%           FncPlotNormNashDAlphaCutsDist.m
%           FncPlotqc.m
%           FncPlotQ.m
%           FncPlotfs.m
%           FncPlotFr.m
%           FncPlotDNH.m
%           FncPlotIc.m
%           FncPlotWTMMStratification.m
%               WTMM_CPT.m
%                   ...
%           Fnc3DStratificationRIGTOSSFrQt.m
%           Fnc3DStratificationRIGTOSSBqQt.m
%           Fnc3DStratificationSIGTOSSFrQt.m
%           Fnc3DStratificationSIGTOSSu2Qt.m
%           FncPlotRobertsonFrQt.m
%           FncPlotRobertsonBqQt.m
%           FncPlotSchneiderFrQt.m
%           FncPlotSchneideru2Qt.m
