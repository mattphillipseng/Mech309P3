function [T_point_at_times]  = euler(grid_x,grid_y,T_b,T_inf,hok,k)

%% Material Constants
rho = 8.96/1000; % Density, [kg/cm^3]
C_p = 0.39; % Heat capacity at const pressure. [kJ/kg-K]

alph = k/(rho*C_p);


%% Build initial solution (temperature) vector
nodes = grid_x*grid_y;

T_last = T_inf*ones(nodes,1);
T_last(1:grid_x) = bottom_T_transient(grid_x,0,T_b,T_inf);

T_vec = T_last;

%% Time step, Max time
dt = 10^(-4); % time step, s
t_max = 4; % s

times = [0:dt:t_max];

%% To store solution vectors over time

%T_times





%% Euler's Method

for time = 0:dt:t_max
    
    % Inside Nodes, PDE!
    for row = 2:(grid_y - 1)
        for col = 2:(grid_x - 1)
            index = ind(row,col);
            T_vec(index) = T_last(index) + dt*alph*(-4*T_last(index) + T_last(index-1) + T_last(index+1) + T_last(index-grid_x) + T_last(index+grid_x))/(dL^2);
        end
    end
    
    % Top Surface
    row = grid_y;
    for col = 2:grid_x-1
        index = ind(row,col);
        num = hok*T_inf + T_last(index-x)/dL; %point below
        denom = hok - 1/dL;
        T_vec(index) = num/denom;
    end

    % Left Surface
    col = 1;
    for row = 2:grid_y-1
        index = ind(row,col);
        num = hok*T_inf + T_last(index+1)/dL; %point to right
        denom = hok - 1/dL;
        T_vec(index) = num/denom;
    end

    % Right Surface
    col = grid_x;
    for row = 2:grid_y-1
        index = ind(row,col);
        num = hok*T_inf + T_last(index-1)/dL; %point to left
        denom = hok - 1/dL;
        T_vec(index) = num/denom;
    end
    
    % Bottom Surface
    T_vec(1:grid_x) = bottom_T_transient(grid_x,time,T_b,T_inf);
    
    
    T_last = T_vec;
end


%% Helper functions
% Gives the index something has to be placed into in the T_vec
function index = ind(row,col)
        index = (row-1)*grid_x + col;
    end


end