function plot_transient_inf = plot_transient_inf(t_inf_euler,times_inf_euler,t_inf_rk2,times_inf_rk2)
%% Make plots
font_size = 15;
line_size = 15;
line_width = 2;

figure
hold on
% index 58 gives x=0.6, y=0.2 on a 16x31 grid
plot(times_inf_euler,t_inf_euler(58,:),'Linewidth',line_width)
plot(times_inf_euler,t_inf_rk2(58,:),'m--','Linewidth',line_width)

xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Temperature (K)','fontsize',font_size,'Interpreter','latex');
legend('Euler','RK4','fontsize',font_size,'Interpreter','latex','Location','southeast','NumColumns',4);
pbaspect([2 1 1]);

print('plots/transient_inf','-depsc','-r720');

plot_transient_inf = true;






end