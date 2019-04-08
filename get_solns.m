%% Plotting Question 2a
% Make sure to run main.m first

function [S1,S2,S3,S4,p2b_table] = get_solns(T_b,T_inf,hok)

p2b_table = zeros(4,1); % num unknowns, cpu time, bytes for A

%% Generating Data for 6x11
tic;
S1 = solve_steady(6,11,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(1,1:3)=[6*11,cpu_time,8*(6*11)^2];

fprintf('6x11 done \n')

%% Generating Data for 16x31
tic;
S2 = solve_steady(16,31,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(2,1:3)=[16*31,cpu_time,8*(16*31)^2];

fprintf('16x31 done \n')

%% Generating Data for 46x91
tic;
S3 = solve_steady(46,91,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(3,1:3)=[46*91,cpu_time,8*(46*91)^2];

fprintf('46x91 done \n')

%% Generating Data for 61x121
tic;
S4 = solve_steady(61,121,T_b,T_inf,hok);
toc;
cpu_time=toc;
p2b_table(4,1:3)=[61*121,cpu_time,8*(61*121)^2];

fprintf('61x121 done \n')

end

