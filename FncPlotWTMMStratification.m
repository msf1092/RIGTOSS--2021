function FncPlotWTMMStratification(Q1, Fr1, Depth)
%
cd 'WTMM-Ching et al 2015'
% WTMM
[layer_boundary,soil_type] = WTMM_CPT(Depth,Fr1,Q1);

end

