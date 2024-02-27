function Gamma_User = FncUserDefinedGamma(Depth)
% The Function takes a nx2 matrix of ['Depth', 'Gamma'], defined by user,
% and computes GammaUser based on interpolation.

depthGammaMat = input('Enter the [Depth, Gamma] matrix: ');
Gamma_User = interp1(depthGammaMat(:,1),depthGammaMat(:,2),Depth,'pchip');

% figure; plot(Gamma_User, Depth, '-b'); hold on; plot(depthGammaMat(:,2),depthGammaMat(:,1), 'r*'); xlabel('Gamma (kN/m^3)'); ylabel('Depth (m)'); legend('User defined','Interpolated'); set(gca,'Ydir','reverse'); grid on
end

