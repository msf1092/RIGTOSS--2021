function [Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr, Bq, Deltau2ToSigmaPrimeV0] = FncReadDataJS(dataFolder, CodesFolder, XLfiles, test_number, Depth_wat)
%%%%%%%%%%%% Importing data from Laura's data bank %%%%%%%%%%%%%%%

%There have been some 'NaN's included in the data. They are removed after
%importing the whole comlumns.

% There have been some files, not including data. They are reported, and
% the stratification model is not run!

% The input Q & Fr data should be in log scale. Here, if they are not in
% log scale, it is identified based on fitting Gaussian pdf. Then, they are
% converted into log scale!

T = readtable(fullfile(dataFolder, XLfiles(test_number).name),'PreserveVariableNames',true);
Depth =         table2array(T(:, {'z'}));               [a,IndNaN1] = rmmissing(Depth);         clear a;
% sigmaPrimev0 =  table2array(T(:, 11));                  [a,IndNaN2] = rmmissing(sigmaPrimev0);  clear a;
% sigmav0 =       table2array(T(:, {'p0'}));              [a,IndNaN3] = rmmissing(sigmav0);       clear a;
qc =            table2array(T(:, {'qc'}));              [a,IndNaN4] = rmmissing(qc);            clear a;
fs =            table2array(T(:, {'fs'}));              [a,IndNaN5] = rmmissing(fs);            clear a;
qt =            table2array(T(:, {'qt'}));              [a,IndNaN6] = rmmissing(qt);            clear a;
u2 =            table2array(T(:, {'u'}));               [a,IndNaN7] = rmmissing(u2);            clear a; %Input data are in MPa!
% Q =             table2array(T(:, {'qt'}));              [a,IndNaN8] = rmmissing(Q);             clear a;
% Fr =            table2array(T(:, {'Rf'}));              [a,IndNaN9] = rmmissing(Fr);            clear a;
% Bq =            table2array(T(:, {'Bq'}));              [a,IndNaN10] = rmmissing(Bq);           clear a;
% Deltau2ToSigmaPrimeV0 = (table2array(T(:, {'pore 2'})) * 1000 - table2array(T(:, {'u0'}))) ./ table2array(T(:, 11));      [a,IndNaN11] = rmmissing(Deltau2ToSigmaPrimeV0);     clear a; %This is used in Schneider's pore pressure chart

%Finding indices of NaN cells. Summation unveils NaNs in any of the arrays.
IndNaNall = IndNaN1 + IndNaN4 + IndNaN5 + IndNaN6 + IndNaN7;      IndNaNall = find(IndNaNall > 0);

Depth(IndNaNall,:) = [];                    %'NaN's are removed
% sigmaPrimev0(IndNaNall,:) = [];             %'NaN's are removed
% sigmav0(IndNaNall,:) = [];                  %'NaN's are removed
qc(IndNaNall,:) = [];                       %'NaN's are removed
fs(IndNaNall,:) = [];                       %'NaN's are removed
qt(IndNaNall,:) = [];                       %'NaN's are removed
u2(IndNaNall,:) = [];                       %'NaN's are removed
% Q(IndNaNall,:) = [];                        %'NaN's are removed
% Fr(IndNaNall,:) = [];                       %'NaN's are removed
% Bq(IndNaNall,:) = [];                       %'NaN's are removed
% Deltau2ToSigmaPrimeV0(IndNaNall,:) = [];	%'NaN's are removed

% Display the error and stop the computations if a file doesn't include
% data!
if isempty(Depth) == 1 || isempty(qc) == 1 || isempty(fs) == 1 || isempty(qt) == 1 || isempty(u2) == 1 %|| isempty(sigmaPrimev0) == 1 || isempty(sigmav0) == 1 || isempty(Q) == 1 || isempty(Fr) == 1 
    disp(fprintf('Error in %d-th Excel file!!! ==> At least one of input Depth/sigmaPrimev0/sigmav0/qc/fs/qt/u2/Q/Fr vectors is empty!', test_number)); 
    Error_in = XLfiles(test_number)
    return
end
%% Calculation of required parameters:
% The parameters are calculated based on Gamma equation proposed by
% Robertson and Cabal (2010). But Input params charts illustrated
% computations based on Mayne et al. (2010)-based params, as well. If you
% wanna change the Gamma-based input params, do it in the function:
OutputFolder = fullfile(CodesFolder,'Output');
[Depth, fs, qc, qt, u2, Rf, sigmaPrimev0, sigmav0, Q, Fr, Bq, Deltau2ToSigmaPrimeV0] = ...
    FncPreprocessData(CodesFolder, OutputFolder, Depth, fs, qc, qt, u2, Depth_wat, test_number);
%%
% Here, it is identified if there is a problem with Fr, based on the fitted 
% Gaussian pdf! The error message is reported!
pd = fitdist(Fr,'Normal'); muFr = pd.mu;
if muFr > 10 
    Fr = (Fr) ./ 1000;
    pd = fitdist(Fr,'Normal');      muFr = pd.mu;
    
    disp('Fr involves erroneous data, most probably!');
    Error_in = XLfiles(test_number)
    return
end

end
