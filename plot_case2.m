function plot_case2 = plot_case2(soln_defl,soln_eig,case2euler)
%% Make plots
font_size = 15;
line_size = 15;
line_width = 2;

dt = 10^(-4);
t_max = 4;
times=[0:dt:t_max];

figure
hold on
% index 1 gives x=0.5, y=0.5 on a 3x5 grid
plot(times,soln_defl(1,:),'c','Linewidth',line_width)

% index 1 gives x=0.5, y=0.5 on a 3x5 grid
plot(times,soln_eig(1,:),'m--','Linewidth',line_width)

% index 5 gives x=0.5, y=0.5 on a 3x5 grid
plot(times,case2euler(5,:),'k','Linewidth',line_width)



xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Temperature (K)','fontsize',font_size,'Interpreter','latex');
legend('Deflation','MATLAB eig','Euler','fontsize',font_size,'Interpreter','latex','Location','southoutside','NumColumns',1);
pbaspect([2 1 1]);

print('plots/case2','-depsc','-r720');

plot_case2 = true;






end