function [T_point]  = euler(grid_x,grid_y,T_b,T_inf,hok)

%% Material Constants
rho = 8.96/1000; % Density, [kg/cm^3]
C_p = 0.39; % Heat capacity at const pressure. [kJ/kg-K]

%% Build initial solution (temperature) vector
nodes = grid_x*grid_y;
T_vec = T_inf*ones(nodes,1);
%delta = 1/(grid_x-1);
T_vec(1:grid_x) = bottom_T_transient(grid_x,0,T_b,T_inf);

%% Euler's Method
dt = 10^(-4); % time step, s
for time = 0:dt:4
    
end