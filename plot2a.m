%% Plotting Question 2a
% Make sure to run main.m first


p2b_table = zeros(4,1); % num unknowns, cpu time, bytes for A

%% Generating Data for 6x11
tic;
soln_6x11 = solve_steady(6,11,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(1,1:3)=[6*11,cpu_time,8*(6*11)^2];

heights_6x11 = linspace(0,2,11);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
temps_6x11 = zeros(11,1);

for t_ind = 1:11
    temps_6x11(t_ind) = soln_6x11(s_ind);
    s_ind = s_ind + 6;
end
fprintf('6x11 done \n')

%% Generating Data for 16x31
tic;
soln_16x31 = solve_steady(16,31,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(2,1:3)=[16*31,cpu_time,8*(16*31)^2];

heights_16x31 = linspace(0,2,31);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
temps_16x31 = zeros(31,1);

for t_ind = 1:31
    temps_16x31(t_ind) = soln_16x31(s_ind);
    s_ind = s_ind + 16;
end
fprintf('16x31 done \n')

%% Generating Data for 46x91
tic;
soln_46x91 = solve_steady(46,91,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(3,1:3)=[46*91,cpu_time,8*(46*91)^2];

heights_46x91 = linspace(0,2,91);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
temps_46x91 = zeros(91,1);

for t_ind = 1:91
    temps_46x91(t_ind) = soln_46x91(s_ind);
    s_ind = s_ind + 46;
end
fprintf('46x91 done \n')

%% Generating Data for 61x121
tic;
soln_61x121 = solve_steady(61,121,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(4,1:3)=[61*121,cpu_time,8*(61*121)^2];

heights_61x121 = linspace(0,2,121);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
temps_61x121 = zeros(121,1);

for t_ind = 1:121
    temps_61x121(t_ind) = soln_61x121(s_ind);
    s_ind = s_ind + 61;
end
fprintf('61x121 done \n')


%% Plotting 2a
font_size = 15;
line_size = 15;
line_width = 2;

figure
hold on
plot(temps_6x11,heights_6x11,'color',[0 0.4470 0.7410],'Linewidth',line_width) %blue
plot(temps_16x31,heights_16x31,'color',[0.6350 0.0780 0.1840],'Linewidth',line_width) %red
plot(temps_46x91,heights_46x91,'color',[0.4660 0.6740 0.1880],'Linewidth',line_width) %green
plot(temps_61x121,heights_61x121,'k','Linewidth',line_width) %black

%title('Temperature Distribution on Left Side of Fin','fontsize',font_size,'Interpreter','latex')
xlabel('Temperature (K)','fontsize',font_size,'Interpreter','latex');
ylabel('Height (cm)','fontsize',font_size,'Interpreter','latex');
legend('6x11','16x31','46x91','61x121','fontsize',font_size-4,'Interpreter','latex','Location','southoutside','NumColumns',4);
pbaspect([3 1 1]);

print('plots/2a','-depsc','-r720');
