function [Depth, fs, qc, qt, u2, Rf, sigmaPrimev0, sigmav0, Q, Fr, Bq, Deltau2ToSigmaPrimeV0] = ...
    FncPreprocessData(CodesFolder, OutputFolder, Depth, fs, qc, qt, u2, Depth_wat, test_number)
% The raw data is processed here:
% qc & qt & u2 are in MPa
% Depth is in m
% It is assumed here that water table is at the surface!
%% Rf
Rf = (fs ./ qt) * 100;          Rf(Rf <= 0) = 0.0000001; %Rf<=0 is replaced, because it gives complex numbers of Gamma!
%% Gamma
fs(fs <= 0) = 0.0000001;
GammaWat = 9.81; %KN/m3
Pa = 101.325e-3; %KPa
Gamma_Robertson                           = (0.27 * log10(Rf*0.01) + 0.36 * (log10(qt/(Pa*0.001))) + 1.236) * GammaWat; %Ref. Robertson, Peter K., and K. L. Cabal. "Estimating soil unit weight from CPT." 2nd International Symposium on Cone Penetration Testing. 2010.
Gamma_Mayne                               = 11.46 + 0.33 * log10(Depth) + 3.10 * log10(fs * 1000) + 0.70 * log10(qt * 1000); %Ref. Mayne, P. W., J. Peuchen, and D. Bouwmeester. "Soil unit weight estimation from CPTs." sat 227 (2010): 3.
Gamma_median_Robertson(1:length(Depth),1) = median(Gamma_Robertson);
Gamma_median_Mayne(1:length(Depth),1)     = median(Gamma_Mayne);
%% Sigma: sigmav0 & sigmaPrimev0
for i = 1 : length(Depth)
    if i == 1
        sigmav0_Robertson(i,1)          = Gamma_Robertson(i,1)          * Depth(i,1);
        sigmav0_Mayne(i,1)              = Gamma_Mayne(i,1)              * Depth(i,1);
        sigmav0_median_Robertson(i,1)   = Gamma_median_Robertson(i,1)   * Depth(i,1);
        sigmav0_median_Mayne(i,1)       = Gamma_median_Mayne(i,1)       * Depth(i,1);
    else
        sigmav0_Robertson(i,1)          = sigmav0_Robertson(i-1,1)        + Gamma_Robertson(i,1)          * (Depth(i,1) - Depth(i-1,1));
        sigmav0_Mayne(i,1)              = sigmav0_Mayne(i-1,1)            + Gamma_Mayne(i,1)              * (Depth(i,1) - Depth(i-1,1));
        sigmav0_median_Robertson(i,1)   = sigmav0_median_Robertson(i-1,1) + Gamma_median_Robertson(i,1)   * (Depth(i,1) - Depth(i-1,1));
        sigmav0_median_Mayne(i,1)       = sigmav0_median_Mayne(i-1,1)     + Gamma_median_Mayne(i,1)       * (Depth(i,1) - Depth(i-1,1));
    end
end
% sigmav0_Robertson        = Gamma_Robertson        .* Depth; %kPa
% sigmav0_Mayne            = Gamma_Mayne            .* Depth; %kPa
% sigmav0_median_Robertson = Gamma_median_Robertson .* Depth; %kPa
% sigmav0_median_Mayne     = Gamma_median_Mayne     .* Depth; %kPa

% sigmaPrimev0_Robertson        = (Gamma_Robertson        - GammaWat) .* Depth; %kPa
% sigmaPrimev0_Mayne            = (Gamma_Mayne            - GammaWat) .* Depth; %kPa
% sigmaPrimev0_median_Robertson = (Gamma_median_Robertson - GammaWat) .* Depth; %kPa
% sigmaPrimev0_median_Mayne     = (Gamma_median_Mayne     - GammaWat) .* Depth; %kPa

sigmaPrimev0_Robertson        = sigmav0_Robertson           - (GammaWat .* (Depth - Depth_wat)); %kPa
sigmaPrimev0_Mayne            = sigmav0_Mayne               - (GammaWat .* (Depth - Depth_wat)); %kPa
sigmaPrimev0_median_Robertson = sigmav0_median_Robertson    - (GammaWat .* (Depth - Depth_wat)); %kPa
sigmaPrimev0_median_Mayne     = sigmav0_median_Mayne        - (GammaWat .* (Depth - Depth_wat)); %kPa


%% Q
Q_Robertson        = (qt .* 10^3 - sigmav0_Robertson)        ./ sigmaPrimev0_Robertson;        %based on Gamma_Robertson
Q_Mayne            = (qt .* 10^3 - sigmav0_Mayne)            ./ sigmaPrimev0_Mayne;            %based on Gamma_Robertson
Q_median_Robertson = (qt .* 10^3 - sigmav0_median_Robertson) ./ sigmaPrimev0_median_Robertson; %based on Gamma_Robertson
Q_median_Mayne     = (qt .* 10^3 - sigmav0_median_Mayne)     ./ sigmaPrimev0_median_Mayne;     %based on Gamma_Robertson
%% Fr
Fr_Robertson        = ((fs .* 10^3) ./ (qt * 10^3 - sigmav0_Robertson))        * 100; %based on Gamma_Robertson
Fr_Mayne            = ((fs .* 10^3) ./ (qt * 10^3 - sigmav0_Mayne))            * 100; %based on Gamma_Robertson
Fr_median_Robertson = ((fs .* 10^3) ./ (qt * 10^3 - sigmav0_median_Robertson)) * 100; %based on Gamma_Robertson
Fr_median_Mayne     = ((fs .* 10^3) ./ (qt * 10^3 - sigmav0_median_Mayne))     * 100; %based on Gamma_Robertson
%% Bq
Bq_Robertson        = (u2 * 10^3 - Depth .* GammaWat) ./ (qt * 10^3 - sigmav0_Robertson)       ;
Bq_Mayne            = (u2 * 10^3 - Depth .* GammaWat) ./ (qt * 10^3 - sigmav0_Mayne)           ;
Bq_median_Robertson = (u2 * 10^3 - Depth .* GammaWat) ./ (qt * 10^3 - sigmav0_median_Robertson);
Bq_median_Mayne     = (u2 * 10^3 - Depth .* GammaWat) ./ (qt * 10^3 - sigmav0_median_Mayne)    ;
%% Deltau2ToSigmaPrimeV0
Deltau2ToSigmaPrimeV0_Robertson        = (u2 * 10^3 - Depth .* GammaWat) ./ sigmaPrimev0_Robertson       ;
Deltau2ToSigmaPrimeV0_Mayne            = (u2 * 10^3 - Depth .* GammaWat) ./ sigmaPrimev0_Mayne           ;
Deltau2ToSigmaPrimeV0_median_Robertson = (u2 * 10^3 - Depth .* GammaWat) ./ sigmaPrimev0_median_Robertson;
Deltau2ToSigmaPrimeV0_median_Mayne     = (u2 * 10^3 - Depth .* GammaWat) ./ sigmaPrimev0_median_Mayne    ;
%% User-defined Gamma interpolation
% Gamma_User                 = FncUserDefinedGamma(Depth);
% sigmav0_User               = Gamma_User .* Depth; %kPa
% sigmaPrimev0_User          = (Gamma_User - GammaWat) .* Depth; %kPa
% Q_User                     = (qt .* 10^3 - sigmav0_User) ./ sigmaPrimev0_User;
% Fr_User                    = ((fs .* 10^3) ./ (qt * 10^3 - sigmav0_User)) * 100;
% Bq_User                    = (u2 * 10^3 - Depth .* GammaWat) ./ (qt * 10^3 - sigmav0_User);
% Deltau2ToSigmaPrimeV0_User = (u2 * 10^3 - Depth .* GammaWat) ./ sigmaPrimev0_User;
%% Robertson / Mayne parameters selection
% ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%%%%%%%%%%%%%%%%%%%% Specify the following params! %%%%%%%%%%%%%%%%%%%%%%%%
% \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
sigmaPrimev0            = sigmaPrimev0_Robertson;
sigmav0                 = sigmav0_Robertson;
Q                       = Q_Robertson;
Fr                      = Fr_Robertson;
Bq                      = Bq_Robertson;
Deltau2ToSigmaPrimeV0   = Deltau2ToSigmaPrimeV0_Robertson;
% /////////////////////////////////////////////////////////////////////////
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Thanks! %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤¤
%% Removing complex numbers
sigmaPrimev0(imag(sigmaPrimev0) ~= 0)                   = NaN; %converting the complex numbers to NaNs  
sigmav0(imag(sigmav0) ~= 0)                             = NaN; %converting the complex numbers to NaNs
Q(imag(Q) ~= 0)                                         = NaN; %converting the complex numbers to NaNs
Fr(imag(Fr) ~= 0)                                       = NaN; %converting the complex numbers to NaNs
Bq(imag(Bq) ~= 0)                                       = NaN; %converting the complex numbers to NaNs
Deltau2ToSigmaPrimeV0(imag(Deltau2ToSigmaPrimeV0) ~= 0) = NaN; %converting the complex numbers to NaNs

[a,IndNaN1]  = rmmissing(Depth);                     clear a;
[a,IndNaN2]  = rmmissing(sigmaPrimev0);              clear a;
[a,IndNaN3]  = rmmissing(sigmav0);                   clear a;
[a,IndNaN4]  = rmmissing(qc);                        clear a;
[a,IndNaN5]  = rmmissing(fs);                        clear a;
[a,IndNaN6]  = rmmissing(qt);                        clear a;
[a,IndNaN7]  = rmmissing(u2);                        clear a; %Input data are in MPa!
[a,IndNaN8]  = rmmissing(Q);                         clear a;
[a,IndNaN9]  = rmmissing(Fr);                        clear a;
[a,IndNaN10] = rmmissing(Bq);                        clear a;
[a,IndNaN11] = rmmissing(Deltau2ToSigmaPrimeV0);     clear a; %This is used in Schneider's pore pressure chart

%Finding indices of NaN cells. Summation unveils NaNs in any of the arrays.
IndNaNall = IndNaN1 + IndNaN2 + IndNaN3 + IndNaN4 + IndNaN5 + IndNaN6 + IndNaN7 + IndNaN8 + IndNaN9 + IndNaN10 + IndNaN11;      IndNaNall = find(IndNaNall > 0);

Depth(IndNaNall,:) = [];                    %'NaN's are removed
Rf(IndNaNall,:) = [];                       %'NaN's are removed
sigmaPrimev0(IndNaNall,:) = [];             %'NaN's are removed
sigmav0(IndNaNall,:) = [];                  %'NaN's are removed
qc(IndNaNall,:) = [];                       %'NaN's are removed
fs(IndNaNall,:) = [];                       %'NaN's are removed
qt(IndNaNall,:) = [];                       %'NaN's are removed
u2(IndNaNall,:) = [];                       %'NaN's are removed
Q(IndNaNall,:) = [];                        %'NaN's are removed
Fr(IndNaNall,:) = [];                       %'NaN's are removed
Bq(IndNaNall,:) = [];                       %'NaN's are removed
Deltau2ToSigmaPrimeV0(IndNaNall,:) = [];	%'NaN's are removed

Gamma_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
Gamma_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
Gamma_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
Gamma_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
sigmav0_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
sigmav0_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
sigmav0_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
sigmav0_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
sigmaPrimev0_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
sigmaPrimev0_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
sigmaPrimev0_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
sigmaPrimev0_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
Q_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
Q_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
Q_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
Q_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
Fr_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
Fr_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
Fr_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
Fr_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
Bq_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
Bq_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
Bq_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
Bq_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
Deltau2ToSigmaPrimeV0_Robertson(IndNaNall,:)        = [];	%'NaN's are removed
Deltau2ToSigmaPrimeV0_Mayne(IndNaNall,:)            = [];	%'NaN's are removed
Deltau2ToSigmaPrimeV0_median_Robertson(IndNaNall,:) = [];	%'NaN's are removed
Deltau2ToSigmaPrimeV0_median_Mayne(IndNaNall,:)     = [];	%'NaN's are removed
%% Nkt_low
Nkt_low = FncNktLow(Depth, qc, fs);
%% Plot & save input params charts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
FncPlotSaveInputsCharts(CodesFolder, OutputFolder, Depth, ...
    Gamma_Robertson, Gamma_Mayne, Gamma_median_Robertson, Gamma_median_Mayne, ...
    sigmav0_Robertson, sigmav0_Mayne, sigmav0_median_Robertson, sigmav0_median_Mayne, ...
    sigmaPrimev0_Robertson, sigmaPrimev0_Mayne, sigmaPrimev0_median_Robertson, sigmaPrimev0_median_Mayne, ...
    Q_Robertson, Q_Mayne, Q_median_Robertson, Q_median_Mayne, ...
    Fr_Robertson, Fr_Mayne, Fr_median_Robertson, Fr_median_Mayne, ...
    Bq_Robertson, Bq_Mayne, Bq_median_Robertson, Bq_median_Mayne, ...
    Deltau2ToSigmaPrimeV0_Robertson, Deltau2ToSigmaPrimeV0_Mayne, Deltau2ToSigmaPrimeV0_median_Robertson, Deltau2ToSigmaPrimeV0_median_Mayne, ...
    test_number)
end

