function SBT = FncSBTpointsLocatorSchneiderFrQt(e, u2, Q)
%UNT1TLED10 Summary of th1s funct1on goes here
% The parameter 'u2' shows the ratio of \Delta u2 to \sigma\prime v_0:
%Boundary Lines equat1ons of Schneider's chart:
Line(1,1) = (7861*u2^2 + 29940 *u2 - 44390) / (u2^4 + 33.84*u2^3 + 2694 *u2^2 + 73050*u2 - 45724);   
Line(1,2) = (            1296  *u2 - 2062 ) / (             u2^3 - 33.7 *u2^2 + 1041 *u2 + 769  );               
Line(1,3) = (            601.3 *u2 - 739.8) / (             u2^3 - 26.6 *u2^2 + 493.9*u2 - 255.2);     
Line(1,4) = (            598.1 *u2 - 578.3) / (             u2^3 - 22.55*u2^2 + 382.3*u2 - 299.3);        
Line(1,5) =              0.8438*u2 + 1.312;
Line(1,6) =            - 0.7734*u2 + 1.364;


    % Zone 1c:
if         3.8451868 < u2 && u2 < 12         &&  Line(1,1) < Q  && Q  < Line(1,2)
    SBT = 1; % It stands for zone '1c'

    % Zone 1b:
elseif       1.33333 < u2  && u2 < 3.8451868 &&  Line(1,1) < Q  && Q < Line(1,3)                     ...
        || 3.8451868 < u2  && u2 < 12        &&  Line(1,2) < Q  && Q < Line(1,3)
    SBT = 2; % It stands for zone '1b'
    
    % Zone 1a / 3:
elseif       0.97000 < u2  && u2 < 1.33333   &&  Line(1,1) < Q  && Q < Line(1,4)                     ...
        ||   1.33333 < u2  && u2 < 12        &&  Line(1,3) < Q  && Q < Line(1,4)
    SBT = 3; % It stands for zone '1a/3'
    
    % Zone 3:
elseif            -4 < u2  && u2 < -1.00813  &&  log10(1)  < Q && Q < log10(1000)                    ...
        || -1.00813  < u2  && u2 <= 0        &&  log10(1)  < Q && Q < Line(1,6)                      ...
        ||        0  < u2  && u2 <= 0.97000  &&  log10(1)  < Q && Q < Line(1,5)                      ...
        ||  0.97000  < u2  && u2 <= 1.02981  &&  Line(1,4) < Q && Q < Line(1,5)                      ...
        ||  1.02981  < u2  && u2 <= 12       &&  Line(1,4) < Q && Q < log10(1000)
    SBT = 4; % It stands for zone '3'
    
    % Zone 2:
elseif            0  < u2  && u2 <  1.02981  &&  Line(1,5) < Q && Q < log10(1000)                    ...
        || -1.00813  < u2  && u2 <= 0        &&  Line(1,6) < Q && Q < log10(1000)
    SBT = 5; % It stands for zone '2'
else
    % Outl1ers (po1nts out of Robertson's chart):
    SBT = 6;    %'6' is the fake SBT!
end
end
