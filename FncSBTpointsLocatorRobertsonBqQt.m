function SBTBqQt = FncSBTpointsLocatorRobertsonBqQt(e, Q, Bq)
% This function, stratifies soils based on the Bq-Qt chart, proposed by
% Robertson (1990)!

%Boundary lines equat1ons of Robertson's chart:
LineBqQt(1,1)  =  3.265879716 * Bq + 3.110623052;
LineBqQt(1,2)  = -1.818207232 * Bq + 0.264357983;
LineBqQt(1,3)  =  1.05513082  * Bq - 0.148738955;
LineBqQt(1,4)  = -1.600284172 * Bq + 1.29653704 ;
LineBqQt(1,5)  =  1.733994587 * Bq - 1.401968115;
LineBqQt(1,6)  = -0.813890117 * Bq + 2.172357422;
LineBqQt(1,7)  = -10.36117113 * Bq + 3.884471325;
LineBqQt(1,8)  = -2.218951696 * Bq + 2.250135275;
LineBqQt(1,9)  =  2.004356634 * Bq + 2.228133613;
LineBqQt(1,10) = -3.393062902 * Bq + 1.484356109;
LineBqQt(1,11) =  2.334503231 * Bq + 1.466663943;
LineBqQt(1,12) = -3.329857642 * Bq + 1.05672363 ;
LineBqQt(1,13) =  1.84466087  * Bq + 1.046817324;
LineBqQt(1,14) = -2.755184033 * Bq + 0.699987821;
LineBqQt(1,15) =  1.635988878 * Bq + 0.695879048;

%     Zone 1:
if 0.809322 < Bq && Bq < 1.4 && log10(1) < Q && Q < LineBqQt(1,5) % points 5 & 6 on the chart in Excel file
    SBTBqQt = 1;
    
    %     Zone 2:
elseif 0.143769     <  Bq && Bq < 0.544275 && 1 < Q && Q < LineBqQt(1,3) ... % points 3 & 4 on the chart in Excel file
        || 0.544275 <= Bq && Bq < 0.809322 && 1 < Q && Q < LineBqQt(1,4)     % points 4 & 5 on the chart in Excel file
    SBTBqQt = 2;
    
    %     Zone 3:
elseif -0.559838        <  Bq && Bq < -0.400367    && LineBqQt(1,2) < Q && Q < LineBqQt(1,1)  ... % points 2  & 18 on the chart in Excel file
        || -0.400367    <= Bq && Bq < 0.0009356893 && LineBqQt(1,2) < Q && Q < LineBqQt(1,14) ... % points 18 & 19 on the chart in Excel file
        || 0.0009356893 <= Bq && Bq < 0.143769     && LineBqQt(1,2) < Q && Q < LineBqQt(1,15) ... % points 19 & 3  on the chart in Excel file
        || 0.143769     <= Bq && Bq < 0.544275     && LineBqQt(1,3) < Q && Q < LineBqQt(1,15) ... % points 3  & 4  on the chart in Excel file
        || 0.544275     <= Bq && Bq < 0.602674     && LineBqQt(1,4) < Q && Q < LineBqQt(1,15) ... % points 4  & 20 on the chart in Excel file
        || 0.602674     <= Bq && Bq < 0.809322     && LineBqQt(1,4) < Q && Q < LineBqQt(1,6)  ... % points 20 & 5  on the chart in Excel file
        || 0.809322     <= Bq && Bq < 1.40286      && LineBqQt(1,5) < Q && Q < LineBqQt(1,6)      % points 5  & 6  on the chart in Excel file
    SBTBqQt = 3;
    
    %     Zone 4:
elseif -0.400367        <  Bq && Bq < -0.311398    && LineBqQt(1,14) < Q && Q < LineBqQt(1,1)  ... % points 18 & 15 on the chart in Excel file
        || -0.311398    <= Bq && Bq < 0.0009356893 && LineBqQt(1,14) < Q && Q < LineBqQt(1,12) ... % points 15 & 19 on the chart in Excel file
        || 0.0009356893 <= Bq && Bq < 0.00191444   && LineBqQt(1,15) < Q && Q < LineBqQt(1,12) ... % points 19 & 16 on the chart in Excel file
        || 0.00191444   <= Bq && Bq < 0.423366     && LineBqQt(1,15) < Q && Q < LineBqQt(1,13) ... % points 16 & 17 on the chart in Excel file
        || 0.423366     <= Bq && Bq < 0.602674     && LineBqQt(1,15) < Q && Q < LineBqQt(1,13)     % points 17 & 20 on the chart in Excel file
    SBTBqQt = 4;
    
    %     Zone 5:
elseif -0.311398        <  Bq && Bq < -0.244223    && LineBqQt(1,12) < Q && Q < LineBqQt(1,1)  ... % points 15 & 12 on the chart in Excel file
        || -0.244223    <= Bq && Bq < 0.00191444   && LineBqQt(1,12) < Q && Q < LineBqQt(1,10) ... % points 12 & 16 on the chart in Excel file
        || 0.00191444   <= Bq && Bq < 0.00308895   && LineBqQt(1,13) < Q && Q < LineBqQt(1,10) ... % points 16 & 13 on the chart in Excel file
        || 0.00308895   <= Bq && Bq < 0.224144     && LineBqQt(1,13) < Q && Q < LineBqQt(1,11) ... % points 13 & 14 on the chart in Excel file
        || 0.224144     <= Bq && Bq < 0.423366     && LineBqQt(1,13) < Q && Q < LineBqQt(1,6)      % points 14 & 17 on the chart in Excel file
    SBTBqQt = 5;
    
    %     Zone 6:
elseif -0.244223        <  Bq && Bq < -0.156885    && LineBqQt(1,10) < Q && Q < LineBqQt(1,1)  ... % points 12 & 9  on the chart in Excel file
        || -0.156885    <= Bq && Bq < 0.00308895   && LineBqQt(1,10) < Q && Q < LineBqQt(1,8)  ... % points 9  & 13 on the chart in Excel file
        || 0.00308895   <= Bq && Bq < 0.00520958   && LineBqQt(1,11) < Q && Q < LineBqQt(1,8)  ... % points 13 & 10 on the chart in Excel file
        || 0.00520958   <= Bq && Bq < 0.133948     && LineBqQt(1,11) < Q && Q < LineBqQt(1,9)  ... % points 10 & 11 on the chart in Excel file
        || 0.133948     <= Bq && Bq < 0.17933      && LineBqQt(1,11) < Q && Q < LineBqQt(1,7)  ... % points 11 & 7  on the chart in Excel file
        || 0.17933      <= Bq && Bq < 0.224144     && LineBqQt(1,11) < Q && Q < LineBqQt(1,6)      % points 7  & 14 on the chart in Excel file
    SBTBqQt = 6;
    
    %     Zone 7:
elseif -0.156885        <  Bq && Bq < -0.0342799   && LineBqQt(1,8)  < Q && Q < LineBqQt(1,1)  ... % points 9  & 1  on the chart in Excel file
        || -0.0342799   <= Bq && Bq < 0.00520958   && LineBqQt(1,8)  < Q && Q < log10(1000)    ... % points 1  & 10 on the chart in Excel file
        || 0.00520958   <= Bq && Bq < 0.0855197    && LineBqQt(1,9)  < Q && Q < log10(1000)    ... % points 10 & 8  on the chart in Excel file
        || 0.0855197    <= Bq && Bq < 0.133948     && LineBqQt(1,9)  < Q && Q < LineBqQt(1,7)      % points 8  & 11 on the chart in Excel file
    SBTBqQt = 7;
    
else
    % Outl1ers (po1nts out of Robertson's chart):
    SBTBqQt = 10;
end
end

