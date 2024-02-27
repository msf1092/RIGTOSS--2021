function alphaCutMat = FncAlphaCutDist(NormNashD) % "X" indicates X(5,1) in FncStratification.m!
% alpha-cut distance is selected here!
% The idea is to select the change points of signal, based on the
% confidence intervals, using the gaussian pdf of NormNashD. 13 CI levels
% are selected: CI = 50, 55, 60, ..., 95, 99.8, 99.98%, AND NormNashD =
% 0.85! 

% "alphaCutMat" indicates the values for "X(5,1)" in "FncStratification.m"!

% Since the outliers in NormNashD brought about problems to find alpha
% cuts,
NormNashD = rmoutliers(NormNashD,'percentiles',[0.0 99.5]);
pd = fitdist(NormNashD,'Normal'); %%Plot%%   %x_values = 0:0.001:1; %y = pdf(pd,x_values); %figure;plot(x_values,y,'LineWidth',2)
CI = [0.5 : 0.090 : 0.95, 0.998, 0.9998]'; % = CI / 100

alphaCutMat = zeros(09,1);
for i = 1 : 8
    alphaCutMat(i,1) = norminv(CI(i,1), pd.mu, pd.sigma);
end
alphaCutMat(09,1) = 0.85;

%% Plot
% figure;
% x_values = 0:0.001:1;
% y = pdf(pd,x_values);
% plot(x_values,y, 'LineWidth',2)
% set(gca, 'fontname','times')
% hold on
% for i = 1 : length(alphaCutMat)
%     x_values = [alphaCutMat(i,1) alphaCutMat(i,1)];     xlabel('Normalized D_{N-H}',           'fontsize',10);
%     y_values = [0 pdf(pd,(pd.mu))];                     ylabel('\it{\Phi_{\mu,\sigma^2} (X)}', 'fontsize',10);
%     plot(x_values, y_values, '-.r', 'LineWidth',0.25)
% end
% hold off
end

