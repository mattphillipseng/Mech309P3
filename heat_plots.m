function heats = heat_plots(S1,S2,S3,S4)

font_size = 15;
line_size = 15;
line_width = 2;

levels = 100;
colormap_setting = 'jet';

%% 6 x 11
x_lin = linspace(0,1,6);
y_lin = linspace(0,2,11);
[S1_X,S1_Y] = meshgrid(x_lin,y_lin);
S1_mat = vector2matrix(S1,6);

figure
contourf(S1_X,S1_Y,S1_mat,levels,'edgecolor','none');
colormap(colormap_setting);
colorbar;
xlabel('x (cm)','fontsize',font_size,'Interpreter','latex');
ylabel('y (cm)','fontsize',font_size,'Interpreter','latex');
pbaspect([1 2 1]);
print('plots/heat1','-depsc','-r720');


%% 16 x 31
x_lin = linspace(0,1,16);
y_lin = linspace(0,2,31);
[S2_X,S2_Y] = meshgrid(x_lin,y_lin);
S2_mat = vector2matrix(S2,16);

figure
contourf(S2_X,S2_Y,S2_mat,levels,'edgecolor','none');
colormap(colormap_setting);
colorbar;
xlabel('x (cm)','fontsize',font_size,'Interpreter','latex');
ylabel('y (cm)','fontsize',font_size,'Interpreter','latex');
pbaspect([1 2 1]);
print('plots/heat2','-depsc','-r720');

%% 46 x 91
x_lin = linspace(0,1,46);
y_lin = linspace(0,2,91);
[S3_X,S3_Y] = meshgrid(x_lin,y_lin);
S3_mat = vector2matrix(S3,46);

figure
contourf(S3_X,S3_Y,S3_mat,levels,'edgecolor','none');
colormap(colormap_setting);
colorbar;
xlabel('x (cm)','fontsize',font_size,'Interpreter','latex');
ylabel('y (cm)','fontsize',font_size,'Interpreter','latex');
pbaspect([1 2 1]);
print('plots/heat3','-depsc','-r720');

%% 61 x 121
x_lin = linspace(0,1,61);
y_lin = linspace(0,2,121);
[S4_X,S4_Y] = meshgrid(x_lin,y_lin);
S4_mat = vector2matrix(S4,61);

figure
contourf(S4_X,S4_Y,S4_mat,levels,'edgecolor','none');
colormap(colormap_setting);
colorbar;
xlabel('x (cm)','fontsize',font_size,'Interpreter','latex');
ylabel('y (cm)','fontsize',font_size,'Interpreter','latex');
pbaspect([1 2 1]);
print('plots/heat4','-depsc','-r720');


heats=true;
end