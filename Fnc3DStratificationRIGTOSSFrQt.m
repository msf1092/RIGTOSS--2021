function z = Fnc3DStratificationRIGTOSSFrQt(SBTs, Depth)
%The 3D stratification result is plotted here
%%
x = zeros(length(SBTs),201);
y = zeros(length(SBTs),201);
z = zeros(length(SBTs),201);
for i = 2:201
    x(:,i) = x(:,i-1) + 0.05;
end
for i = 1:201
    y(:,i) = Depth(:,1);
end
Stdev = 0.4;
n = size(SBTs);     n = n(1,2);
for i = 1:n
    SBT = SBTs(:,i);
    for j = 1:201
        for k = 1:length(SBT)
            ave = SBT(k);
            Z(k,j) = (1/(Stdev*((2*pi())^0.5)))*exp(-((x(k,j)-ave)^2)/(2*Stdev^2));
        end
    end
    z = Z + z;
end
z = z./max(max(z));

set(gca,'defaulttextinterpreter','latex');
surf(x,y,z);    grid off;   shading interp; material dull
% title('RIGTOSS_{F_r - Q_t}','fontsize',8)
[az, el] = view;% Get azimuth and elevation of current view
az = -0.005;    el = 89.999;% Change view of plot
view (az, el)
% cb = colorbar('east','FontSize',7,'color','white');%cb.Layout.Tile = 'east'; % set(cb,'position',[.84 .24 .01 .35])
axis tight
ax = gca;   ax.FontSize = 8; %tick labels size
set(gca, 'Ydir','reverse')
% xlabel('SBT','FontSize',10);
ylabel('Depth (m)','FontSize',10,'Interpreter','latex');
% % %increase space between xlabel and tick labels
% % % xh = get(gca,'xlabel'); % handle to the label object
% % % p = get(xh,'position'); % get the current position property
% % % p(2) = - 0.3 + p(2) ;   % double the distance. negative values put the label below the axis
% % % set(xh,'position',p);   % set the new position
% % % xh.Position = xh.Position + 0.2;  % move the label 0.1 data-units further down
A_x = [1 2 3 4 5 6 7 8 9];
xticks(A_x);
% ylabel('Depth (m)','FontSize',9)
h=gca; 
h.ZAxis.TickLength = [0 0];%get rid of zAxis ticks
h.XAxis.TickLength = [0.1 0.008];
h.YAxis.TickLength = [0.05 0.008];
set(gca,'ZTickLabel',[]);
% set(gca,'YTickLabel',[]);
% grid on
% set(gcf,'position',[50,50,1000,500])

%%% Gridlines:
hold on
% Find the maximum z value for each column
max_z = max(max(z, [], 1));
max_y = max(max(y, [], 1));
min_y = min(min(y, [], 1));
% Create a dotted line for each maximum z value
for i = 1:length(A_x)
    line([A_x(i),A_x(i)], [min_y, max_y], [max_z, max_z], 'LineStyle', ':',"Linewidth",0.3, 'Color', [0.2 1.0 0.2]);
end
hold off

end

