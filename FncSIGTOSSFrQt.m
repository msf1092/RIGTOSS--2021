function [SBTs, NormNashD] = FncSIGTOSSFrQt(Depth, Q, Fr)
% This function finds the SBT based on the Fr-Qt chart proposed by
% Schneider (2012), using SIGTOSS model!

%% Finding the initial Soil Behavior Type (SBT) of each data based on Schneider (2012):
n = size(Q);
n = n(1,1);
SBT = zeros(n,1);
% Line = zeros(n,8);
Q  = log10(Q);
Fr = log10(Fr);
% In the following lines, each data point is assigned to a zone of soil
% behavior type (SBT) on Schneider chart:
for i = 1 : n
    e = 1;
    SBT(i,e) = FncSBTpointsLocatorSchneiderFrQt(e, Fr(i), Q(i));
end
% The outliers should be corrected. Hence, We decided to shift the SBT=0 of
% any point to the previous (top) SBT(i), except for i=1, i.e. the first
% data point, which is set equal to the next data point:
for i = 1 : n
    if i == 1
        if SBT(i) == 0
            SBT(i) = SBT(i+1);
        end
    end
    if SBT(i) == 0
        SBT(i) = SBT(i-1);
    end
end

for e = 1 : 1
    SBT(:,1) = SBT(:,1);
end
%% Finding Nash Theory-based distance factors:

% Distance are considered as: D1=D(t,t+1); D2=D(t,t+2); D3=D(t,t+4); D4=D(t,t+10):
D1 = zeros(n,1);
D2 = zeros(n,1);
D3 = zeros(n,1);
D4 = zeros(n,1);

for i = 1 : n - 1
    D1(i) = (abs((Fr(i)) - (Fr(i+1)))) ^2 + (abs((Q(i)) - (Q(i+1))))^2;
end
maxD1=max(D1);
for i=1:n
    NormD1(i,1)=(D1(i))/maxD1;
end

for i=1:n-2
    D2(i) =(abs((Fr(i))-(Fr(i+2))))^2+(abs((Q(i))-(Q(i+2))))^2;
end
maxD2=max(D2);
for i=1:n
    NormD2(i,1)=(D2(i))/maxD2;
end

for i=1:n-4
    D3(i) =(abs((Fr(i))-(Fr(i+4))))^2+(abs((Q(i))-(Q(i+4))))^2;
end
maxD3=max(D3);
for i=1:n
    NormD3(i,1)=(D3(i))/maxD3;
end

for i=1:n-10
    D4(i) =(abs((Fr(i))-(Fr(i+10))))^2+(abs((Q(i))-(Q(i+10))))^2;
end
maxD4=max(D4);
for i=1:n
    NormD4(i,1)=(D4(i))/maxD4;
end

%% Optimization of Nash-Harsanyi powers and alpha-cut distance criterion:
% alpha-cut distance is X(5,1) below (the optimized is 0.0875):
X(1,1)=0.7865;
X(2,1)=0.5046;
X(3,1)=0.3255;
X(4,1)=0.1691;
%to save the Fr and Q values, to be exported into the final file
% Fr1 = Fr;
% Q1 = Q;
%To draw SBTs:
SBTs = zeros(length(Depth),9);
for k=1:09 %13 CI levels are considered in "FncAlphaCutDist.m"
    % alpha-cut distance:
    %%%%%%%%%% X(5,1) = k * 0.1; %%%%%%%%%% "X(5,1)" is the alpha-cut distance!
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%% Note! Firstly, we used 10 linear divisions of alpha-cut distances,
    %%% which is published in our paper: """Farhadi, M.S., Länsivaara, T. 
    %%% Development of an integrated game theory-optimization subground 
    %%% stratification model using cone penetration test (CPT) measurements. 
    %%% Engineering with Computers (2021). https://doi.org/10.1007/s00366-020-01243-0""".
    %%% But it did not work well for Norway data. Now, it depends on the 
    %%% variation of NormNashD variation. More explained in the "FncAlphaCutDist" 
    %%% function, coming in the following lines, in the next section!
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    
    % Calculate the fitness:
    y = zeros(n,1);
    for f = 1 : n
        if f < n-9
            NashD(f,1) = (NormD1(f)^X(1,1)) * (NormD2(f)^(X(2,1))) * (NormD3(f)^X(3,1)) * (NormD4(f)^X(4,1));
        end
        if f > n-10 && f < n-3
            NashD(f,1) = (NormD1(f)^X(1,1)) * (NormD2(f)^(X(2,1))) * (NormD3(f)^X(3,1));
        end
        if f > n-4 && f < n-1
            NashD(f,1) = (NormD1(f)^X(1,1)) * (NormD2(f)^(X(2,1)));
        end
        if n == n
            NashD(f,1) = (NormD1(f)^X(1,1));
        end
    end
    for f=1:n
        NormNashD(f,1)=(NashD(f,1))/(max(NashD(:,1)));
    end
    
    %% Modification of SBT based on the Normalized Nash Distance:
    % The most important parameter which plays role here is the Nash Distance
    % Criterion introduced here as NDCrit. Or, better, alpha-cut distance,
    % shown with X(5,1):
    alphaCutMat = FncAlphaCutDist(NormNashD);
    X(5,1) = alphaCutMat(k,1);
    P=zeros(n,1);
    % % Firstly, a vector should be made to find the sections/clusters, named here as P vector:
    for i=1:n-2
        % % Cause of the used method, the two first data points should be considered separately and cannot follow the general code:
        if i==1
            if NormNashD(i,e)>X(5,1)
                P(i,1)=1;
                % The ending cluster cut:
                if NormNashD(i+1,1)>(0.5*NormNashD(i,1))
                    P(i+1,1)=1;
                end
                
                if NormNashD(i+1,1)>(0.5*NormNashD(i,1)) && NormNashD(i+2,1)>(0.5*NormNashD(i,1))
                    P(i+2,1)=1;
                end
            end
        end
        
        if i==2
            if NormNashD(i,1)>X(5,1)
                P(i,1)=1;
                % The initial cluster cut:
                if NormNashD(i-1,1)>(0.5*NormNashD(i,1))
                    P(i-1,1)=1;
                end
                % The ending cluster cut:
                if NormNashD(i+1,1)>(0.5*NormNashD(i,1))
                    P(i+1,1)=1;
                end
                
                if NormNashD(i+1,1)>(0.5*NormNashD(i,1)) && NormNashD(i+2,1)>(0.5*NormNashD(i,1))
                    P(i+2,1)=1;
                end
            end
        end
        
        % % General code:
        
        if i>2 && NormNashD(i,1)>X(5,1)
            P(i,1)=1;
            % The initial cluster cut:
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1))
                P(i-1,1)=1;
            end
            
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1)) && NormNashD(i-2,1)>(0.5*NormNashD(i,1))
                P(i-2,1)=1;
            end
            
            % The ending cluster cut:
            if NormNashD(i+1,1)>(0.5*NormNashD(i,1))
                P(i+1,1)=1;
            end
            
            if NormNashD(i+1,1)>(0.5*NormNashD(i,1)) && NormNashD(i+2,1)>(0.5*NormNashD(i,1))
                P(i+2,1)=1;
            end
        end
        
        % % Cause of the used method, the two last data points should be considered separately and cannot follow the general code:
        if i==n-1 && NormNashD(i,1)>X(5,1)
            P(i,1)=1;
            % The initial cluster cut:
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1))
                P(i-1,1)=1;
            end
            
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1)) && NormNashD(i-2,1)>(0.5*NormNashD(i,1))
                P(i-2,1)=1;
            end
            
            % The ending cluster cut:
            if NormNashD(i+1,1)>(0.5*NormNashD(i,1))
                P(i+1,1)=1;
            end
        end
        
        if i==n && NormNashD(i,1)>X(5,1)
            P(i,1)=1;
            % The initial cluster cut:
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1))
                P(i-1,1)=1;
            end
            
            if NormNashD(i-1,1)>(0.5*NormNashD(i,1)) && NormNashD(i-2,1)>(0.5*NormNashD(i,1))
                P(i-2,1)=1;
            end
            
            % The ending cluster cut:
            if NormNashD(i+1,1)>(0.5*NormNashD(i,1))
                P(i+1,1)=1;
            end
        end
    end
    
    % % Derivation of a vector matrix based on the P vector to identify layers:
    counter=0;
    for i=1:n
        % Based on the utilized formulation, I should use different loop range
        % for the beginning and ending of the vector matrix:
        if i==1
            if P(i,1)==1 && P(i+1,1)==0 && P(i+2,1)==0
                counter=counter+1;
                LayerInd(counter,:)=i+1;
            else
                if P(i,1)==0 && P(i+1,1)==0
                    counter=counter+1;
                    LayerInd(counter,:)=i;
                end
                %                 if P(i,e)==1 && P(i+1,e)==1 && P(i+2,e)==0 && P(i+3,e)==0
                %                     counter=counter+1;
                %                     LayerInd(counter,e)=i+2;
                %                 end
            end
        end
        
        % General code
        if i > 1 && i < n-1
            % the beginning of the layer:
            if P(i,1) == 1 && P(i+1,1) == 0 && P(i+2,1) == 0
                counter = counter+1;
                LayerInd(counter,:) = i+1;
            end
            % the end of the layer:
            if P(i-1,1) == 0 && P(i,1) == 0 && P(i+1,1) == 1
                counter = counter + 1;
                LayerInd(counter,:) = i;
            end
        end
        
        % For the ending of the loop:
        if i==n-1
            if P(i-1,1) == 0 && P(i,1) == 0 && P(i+1,1) == 1
                counter = counter + 1;
                LayerInd(counter,:) = i;
            end
        end
        
        if i == n
            if P(i-1,1) == 0 && P(i,1) == 0
                counter = counter+1;
                LayerInd(counter,:) = n;
            end
        end
    end
    % Modification of LayerInd, if LayerInd(1,1)=1;
    a = length(LayerInd);
    if LayerInd(1,1) == 1
        LayerInd(a,:) = [];
        LayerInd(1,:) = [];
    end
    % Modification of the SBT vector based on the layers vector:
    m = size(LayerInd);
    m = m(1,1);
    
    % Finding Layers and averaging the Fr and Q
    for j=1:2:m-1
        InitInd             = LayerInd(j,1);
        EndInd              = LayerInd(j+1,1);
        FrTemp              = Fr(InitInd:EndInd);
        FrAve               = sum(FrTemp)/numel(FrTemp);%mean(FrTemp,'all');
        QTemp               = Q(InitInd:EndInd);
        QAve                = sum(QTemp)/numel(QTemp);
        Fr(InitInd:EndInd)  = FrAve;
        Q(InitInd:EndInd)   = QAve;
        
        % Changing the layers STB based on the average of Fr and Q of layer:
        for i = InitInd : EndInd
            SBT(i,e) = FncSBTpointsLocatorSchneiderFrQt(e,Fr(i),Q(i));
        end
        
        
        if j==1 && LayerInd(j,e)>1
            InitInd=1;
            EndInd=LayerInd(j,e)-1;
            FrTemp=Fr(InitInd:EndInd);
            FrAve=sum(FrTemp)/numel(FrTemp);
            QTemp=Q(InitInd:EndInd);
            QAve=sum(QTemp)/numel(QTemp);
            Fr(InitInd:EndInd)=FrAve;
            Q(InitInd:EndInd)=QAve;
            % Changing the layers STB based on the average of Fr and Q of layer:
            for i=InitInd:EndInd
                SBT(i,e) = FncSBTpointsLocatorSchneiderFrQt(e,Fr(i),Q(i));
            end
            
        else
            InitInd=LayerInd(j-1,e)+1;
            EndInd=LayerInd(j,e)-1;
            FrTemp=Fr(InitInd:EndInd);
            FrAve=sum(FrTemp)/numel(FrTemp);
            QTemp=Q(InitInd:EndInd);
            QAve=sum(QTemp)/numel(QTemp);
            Fr(InitInd:EndInd)=FrAve;
            Q(InitInd:EndInd)=QAve;
            % Changing the layers STB based on the average of Fr and Q of layer:
            for i=InitInd:EndInd
                SBT(i,e) = FncSBTpointsLocatorSchneiderFrQt(e,Fr(i),Q(i));
            end
            
        end
        if j==m-1 && LayerInd(j+1,e)<n
            InitInd=LayerInd(j+1,e)+1;
            EndInd=n;
            FrTemp=Fr(InitInd:EndInd);
            FrAve=sum(FrTemp)/numel(FrTemp);
            QTemp=Q(InitInd:EndInd);
            QAve=sum(QTemp)/numel(QTemp);
            Fr(InitInd:EndInd)=FrAve;
            Q(InitInd:EndInd)=QAve;
            % Changing the layers STB based on the average of Fr and Q of layer:
            for i=InitInd:EndInd
                SBT(i,e) = FncSBTpointsLocatorSchneiderFrQt(e,Fr(i),Q(i));
            end
            
        end
    end
    
    % The outliers should be corrected. Hence, We decided to shift the SBT=0 of
    % any point to the previous (top) SBT(i), except for i=1, i.e. the first
    % data point, which is set equal to the next data point:
    for i=1:n
        if i==1
            if SBT(i,e)==0
                SBT(i,e)=SBT(i+1,e);
            end
        end
        if SBT(i,e)==0
            SBT(i,e)=SBT(i-1,e);
        end
    end
        
    SBTs(:,k) = SBT(:,1);
end
end

