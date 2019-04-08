%% Makes line plot for problem 2a
function plots2a = plot2a(S1,S2,S3,S4)

%% Prepare Data
% 6 by 11
heights_6x11 = linspace(0,2,11); %from 0 to 2, with 11 nodes

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
TL_6x11 = zeros(11,1);

for t_ind = 1:11
    TL_6x11(t_ind) = S1(s_ind);
    s_ind = s_ind + 6;
end

% 16 by 31
heights_16x31 = linspace(0,2,31);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
TL_16x31 = zeros(31,1);

for t_ind = 1:31
    TL_16x31(t_ind) = S2(s_ind);
    s_ind = s_ind + 16;
end

% 46 by 91
heights_46x91 = linspace(0,2,91);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
TL_46x91 = zeros(91,1);

for t_ind = 1:91
    TL_46x91(t_ind) = S3(s_ind);
    s_ind = s_ind + 46;
end

% 61 by 121
heights_61x121 = linspace(0,2,121);

s_ind = 1; %soln matrix index
t_ind = 1; %index for temps to plot
TL_61x121 = zeros(121,1);

for t_ind = 1:121
    TL_61x121(t_ind) = S4(s_ind);
    s_ind = s_ind + 61;
end


%% Make Plot
font_size = 15;
line_size = 15;
line_width = 2;

figure
hold on
plot(TL_6x11,heights_6x11,'color',[0 0.4470 0.7410],'Linewidth',line_width) %blue
plot(TL_16x31,heights_16x31,'color',[0.6350 0.0780 0.1840],'Linewidth',line_width) %red
plot(TL_46x91,heights_46x91,'color',[0.4660 0.6740 0.1880],'Linewidth',line_width) %green
plot(TL_61x121,heights_61x121,'k','Linewidth',line_width) %black

%title('Temperature Distribution on Left Side of Fin','fontsize',font_size,'Interpreter','latex')
xlabel('Temperature (K)','fontsize',font_size,'Interpreter','latex');
ylabel('Height (cm)','fontsize',font_size,'Interpreter','latex');
legend('6x11','16x31','46x91','61x121','fontsize',font_size-4,'Interpreter','latex','Location','southoutside','NumColumns',4);
pbaspect([3 1 1]);

print('plots/2a','-depsc','-r720');

plots2a = true;

end