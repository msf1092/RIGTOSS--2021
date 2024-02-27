function SBT = FncSBTpointsLocatorSchneiderFrQt(e, Fr, Q)
%UNT1TLED10 Summary of th1s funct1on goes here
%   Deta1led explanat1on goes here
%Boundary Lines equat1ons of Schneider's Fr-Qt chart:
Line(1,1) = (             - 524.4*Fr^2  - 237.6*Fr + 848.7)     / (Fr^4 + 814.3*Fr^3 + 4563 *Fr^2 - 13510*Fr + 8155);   %In Excel file it is illustrated as line 4!
Line(1,2) = (                           - 7.102*Fr + 6.555)     / (Fr^4 + 8.338*Fr^3 + 10.15*Fr^2 - 46.84*Fr + 27.2);               %In Excel file it is illustrated as line 3!
Line(1,3) = (- 327.7*Fr^3 + 6481*Fr^2   - 9851*Fr  + 3617)      / (             Fr^3 + 13580*Fr^2 - 17150*Fr + 5389);     %In Excel file it is illustrated as line 2!
Line(1,4) = (                           - 2.599*Fr + 0.0002874) / (Fr^4 + 2.418*Fr^3 + 2.189*Fr^2 - 1.176*Fr - 0.01241);        %In Excel file it is illustrated as line 1!

    % Zone 1a:
if         log10(0.1) < Fr  &&  Fr < log10(10)                       ...
        && Line(1,1)  < Q   &&  Q  < log10(1000)  &&  Q < Line(1,2)
    SBT = 1; % stands for zone '1a'

    % Zone 1b:
elseif     log10(0.1) < Fr  &&  Fr < log10(7.64422)                  ...
        && Line(1,2)  < Q   &&  Q  < log10(1000)  && Q < Line(1,3)
    SBT = 2; % stand for zone '1b'
    
    % Zone 1c / 3:
elseif     log10(0.1) < Fr  &&  Fr < log10(3.83119)                  ...
        && Line(1,3)  < Q   &&  Q  < log10(1000)  && Q < Line(1,4)
    SBT = 3;
    
    % Zone 2:
elseif     log10(0.1) < Fr  &&  Fr < log10(0.92612)                  ...
        && Line(1,4)  < Q   &&  Q  < log10(1000)
    SBT = 4;
else
    % Outl1ers (points out of Schneider's Fr-Qt chart):
    SBT = 5;    %'6' is the fake SBT!
end
end
