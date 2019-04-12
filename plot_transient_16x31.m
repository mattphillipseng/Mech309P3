function plot_transient_16x31 = plot_transient_16x31(transient_euler_16x31,times_euler_16x31,transient_rk2_16x31,times_rk2_16x31)

% Bilinear interpolation formula source
% https://structx.com/Bilinear_interpolation.html

steps = size(times_euler_16x31);
step_num = steps(2);

%% Euler
% Bilinear interpolation
pts_euler_16x31 = (step_num);
for lv1 = 1:step_num
    x1 = 0; % left
    x2=0.5; % right
    y1=0; % bottom
    y2=0.5; % top
    
    p11 = transient_euler_16x31(1,lv1); % left bottom
    p12 = transient_euler_16x31(4,lv1); % left top
    p21 = transient_euler_16x31(2,lv1); % right bottom
    p22 = transient_euler_16x31(5,lv1); % right top
    
    x = 1/3;
    y = 0.4;
    
    part1 = ( ((x2-x)*(y2-y)) / ((x2-x1)*(y2-y1)) )*p11;
    part2 = ( ((x-x1)*(y2-y)) / ((x2-x1)*(y2-y1)) )*p21;
    part3 = ( ((x2-x)*(y-y1)) / ((x2-x1)*(y2-y1)) )*p12;
    part4 = ( ((x-x1)*(y-y1)) / ((x2-x1)*(y2-y1)) )*p22;
    
    P = part1 + part2 + part3 + part4;
    
    pts_euler_16x31(lv1)=P;
end

pts_euler_16x31;

%% RK2
%% Euler
% Bilinear interpolation
pts_rk2_16x31 = (step_num);
for lv1 = 1:step_num
    x1 = 0; % left
    x2=0.5; % right
    y1=0; % bottom
    y2=0.5; % top
    
    p11 = transient_rk2_16x31(1,lv1); % left bottom
    p12 = transient_rk2_16x31(4,lv1); % left top
    p21 = transient_rk2_16x31(2,lv1); % right bottom
    p22 = transient_rk2_16x31(5,lv1); % right top
    
    x = 1/3;
    y = 0.4;
    
    part1 = ( ((x2-x)*(y2-y)) / ((x2-x1)*(y2-y1)) )*p11;
    part2 = ( ((x-x1)*(y2-y)) / ((x2-x1)*(y2-y1)) )*p21;
    part3 = ( ((x2-x)*(y-y1)) / ((x2-x1)*(y2-y1)) )*p12;
    part4 = ( ((x-x1)*(y-y1)) / ((x2-x1)*(y2-y1)) )*p22;
    
    P = part1 + part2 + part3 + part4;
    
    pts_rk2_16x31(lv1)=P;
end

pts_rk2_16x31;


%% Make plots
font_size = 15;
line_size = 15;
line_width = 2;

figure
hold on
plot(times_euler_16x31,pts_euler_16x31,'Linewidth',line_width)
plot(times_euler_16x31,pts_rk2_16x31,'m--','Linewidth',line_width)

xlabel('Time (s)','fontsize',font_size,'Interpreter','latex');
ylabel('Temperature (K)','fontsize',font_size,'Interpreter','latex');
%legend('Euler','RK4','fontsize',font_size,'Interpreter','latex','NumColumns',4);
pbaspect([2 1 1]);

print('plots/transient','-depsc','-r720');

plot_transient_16x31 = true;


%figure
%plot(times_euler,transient_rk2(8,:),'Linewidth',line_width)






end