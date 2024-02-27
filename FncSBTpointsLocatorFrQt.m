function SBT = FncSBTpointsLocatorFrQt(e, Fr, Q)
%UNT1TLED10 Summary of th1s funct1on goes here
%   Deta1led explanat1on goes here
%Boundary l1nes equat1ons of Robertson's chart:
L1ne(1,1) = -2.747*Fr^5-7.17*Fr^4-7.066*Fr^3-3.836*Fr^2-1.721*Fr+0.4744;
L1ne(1,2) = 1.086*Fr^4-0.8107*Fr^3-0.09045*Fr^2+0.8637*Fr-0.1521;
L1ne(1,3) = 0.4864*Fr^3+0.2955*Fr^2+0.7638*Fr+0.7346;
L1ne(1,4) = 1.204*exp(0.5827*Fr)+0.003381*exp(8.784*Fr);
L1ne(1,5) = 0.7409*Fr^4+1.503*Fr^3+1.286*Fr^2+0.8894*Fr+1.806;
L1ne(1,6) = 0.5231*Fr^3+1.518*Fr^2+1.743*Fr+2.924;
L1ne(1,7) = -0.429*Fr^4-1.195*Fr^3+5.555*Fr^2-6.068*Fr+3.917;
L1ne(1,8) = 258.4*Fr^3-453.1*Fr^2+268.6*Fr-51.57;

%     Zone 1:
if -1<Fr && Fr<log10(1.5057) && 0<Q && Q<L1ne(1,1)
    SBT=1;
    %     Zone 2:
elseif log10(1.5278)<Fr && Fr<1 && 0<Q && Q<L1ne(1,2)
    SBT=2;
    %     Zone 3:
elseif log10(0.7488)<Fr && Fr<log10(1.5057) && L1ne(1,1)<Q && Q<L1ne(1,3) ...
        || log10(1.5057)<Fr && Fr<log10(6.5817) && L1ne(1,2)<Q && Q<L1ne(1,3) ...
        || log10(6.5817)<Fr && Fr<1 && L1ne(1,2)<Q && Q<L1ne(1,7)
    SBT=3;
    %     Zone 4:
elseif log10(0.3141)<Fr && Fr<log10(0.7488) && L1ne(1,1)<Q && Q<L1ne(1,4) ...
        || log10(0.7488)<Fr && Fr<log10(3.4646) && L1ne(1,3)<Q && Q<L1ne(1,4) ...
        || log10(3.4646)<Fr && Fr<log10(6.5817) && L1ne(1,3)<Q && Q<L1ne(1,7)
    SBT=4;
    %     Zone 5:
elseif -1<Fr && Fr<log10(0.3141) && L1ne(1,1)<Q && Q<L1ne(1,5) ...
        || log10(0.3141)<Fr && Fr<log10(2.3053) && L1ne(1,4)<Q && Q<L1ne(1,5) ...
        || log10(2.3053)<Fr && Fr<log10(3.4646) && L1ne(1,4)<Q && Q<L1ne(1,7)
    SBT=5;
    %     Zone 6:
elseif -1<Fr && Fr<log10(1.1016) && L1ne(1,5)<Q && Q<L1ne(1,6) ...
        || log10(1.1016)<Fr && Fr<log10(1.5113) && L1ne(1,5)<Q && Q<3 ...
        || log10(1.5113)<Fr && Fr<log10(2.3053) && L1ne(1,5)<Q && Q<L1ne(1,7)
    SBT=6;
    %     Zone 7:
elseif -1<Fr && Fr<log10(1.1016) && L1ne(1,6)<Q && Q<3
    SBT=7;
    %     Zone 8:
elseif log10(1.5113)<Fr && Fr<log10(3.4635) && L1ne(1,7)<Q && Q<3 ...
        || log10(3.4635)<Fr && Fr<log10(4.9598) && L1ne(1,8)<Q && Q<3
    SBT=8;
    %     Zone 9:
elseif log10(3.4635)<Fr && Fr<log10(4.9598) && L1ne(1,7)<Q && Q<L1ne(1,8) ...
        || log10(4.9598)<Fr && Fr<1 && L1ne(1,7)<Q && Q<3
    SBT=9;
else
    % Outl1ers (po1nts out of Robertson's chart):
    SBT = 10;
end
end
