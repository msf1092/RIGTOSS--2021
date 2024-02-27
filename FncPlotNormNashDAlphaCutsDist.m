function FncPlotNormNashDAlphaCutsDist(NormNashD, Depth, j, A)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
pd = fitdist(NormNashD, 'Normal'); %%Plot%%   %x_values = 0:0.001:1; %y = pdf(pd,x_values); %figure;plot(x_values,y,'LineWidth',2)
CI = [0.5 : 0.090 : 0.95, 0.998, 0.9998]'; % = CI / 100
alphaCutMat = zeros(09,1);
for i = 1 : 8
    alphaCutMat(i,1) = norminv(CI(i,1),pd.mu,pd.sigma);
end
alphaCutMat(09,1) = 0.85;
%%
nexttile(j,[1 1])

x_values = 0:0.001:1;
y = pdf(pd,x_values);
plot(x_values,y, 'LineWidth',2);      xlabel(A, 'fontsize',10);    ylabel('\it{\Phi_{\mu,\sigma^2} (X)}', 'fontsize',10);
hold on
for i = 1 : length(alphaCutMat)
    x_values = [alphaCutMat(i,1) alphaCutMat(i,1)];
    y_values = [0 pdf(pd,(pd.mu))];                     
    plot(x_values, y_values, '-.r', 'LineWidth',0.25)
end
set(gca, 'fontname','times')
%%
nexttile(j+4,[3 1])
plot(NormNashD, Depth, 'LineWidth',1)
hold on
for i = 1 : length(alphaCutMat)
    x_values = [alphaCutMat(i,1) alphaCutMat(i,1)];
    y_values = [min(Depth)       max(Depth)];
    plot(x_values, y_values, '-.r', 'LineWidth',0.25)
end
set(gca,'Ydir','reverse', 'fontname','times')
xlabel(A, 'fontsize',10);   ylabel('Depth (m)', 'fontsize',10);   
hold off
end

