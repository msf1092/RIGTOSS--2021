function [Depth, sigmaPrimev0, sigmav0, qc, fs, qt, u2, Q, Fr] = PreProcess(data, a)
%This module computes the desired values of CPT from the raw data:
%'data' columns are:(1)depth (2)sigmaPrimev0 (3)sigmav0 (4)qc (5)fs (6)u2: 
Depth = data(:,1);
sigmaPrimev0 = data(:,2);
sigmav0 = data(:,3);

qc = data(:,4);
fs = data(:,5);
u2 = data(:,6);
n = length(data);

qt = qc + (1 - a) .* u2; %correction for area ratio of piezocone
% Q = (qt - sigmav0) ./ sigmaPrimev0;%Qt1
Q = qc;

% Fr =(fs ./ (qt - sigmav0)) * 100;
Fr = fs;
end

