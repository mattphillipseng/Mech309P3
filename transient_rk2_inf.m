function [T_times,times]  = transient_rk2_inf(grid_x,grid_y,T_b,T_inf,hok,k)

%% Material Constants
%rho = 8.96/1000; % Density, [kg/cm^3]
rho = 8.96; % Density, [kg/cm^3]
C_p = 0.39; % Heat capacity at const pressure. [kJ/kg-K]

alph = k/(rho*C_p);


%% Build initial solution (temperature) vector
nodes = grid_x*grid_y;
dL = 1/(grid_x-1);

T_last = T_inf*ones(nodes,1);
%T_last(1:grid_x) = bottom_T_transient(grid_x,0,T_b,T_inf);

T_vec = T_last;

%% Time step, Max time
dt = 10^(-4); % time step, s

%times = [0:dt:t_max];

%% To store solution vectors at each time step
% steps = size(times);
% s = steps(2); %
% T_times = zeros(nodes,s);

%% Function for RK
    function result = f_rk(T_last,index)
        T_middle = T_last(index);
        
        T_above = T_last(index + grid_x);
        T_below = T_last(index - grid_x);
        T_left = T_last(index - 1);
        T_right = T_last(index + 1);
        
        result = alph*((-4*T_middle) + T_above + T_below + T_left + T_right)*(1/(dL^2));
    end




%% RK2 Method
step = 1; % just used to store the solution matrix at each time step
time=0;
max_diff=1;
while max_diff>(10^-4)
    
if time~=0    
    % Inside Nodes, PDE!
    for row = 2:(grid_y - 1) %go through rows (2:4)
        for col = 2:(grid_x - 1) % go through cols (2:2)
            index = ind(row,col);
            
            K1 = f_rk(T_last , index);
            K2 = f_rk(T_last+(dt/2)*K1 , index);
            
            T_vec(index) = T_last(index) + dt*K2;
        end
    end
    
    % Bottom Surface
    T_vec(1:grid_x) = bottom_T_transient(grid_x,time,T_b,T_inf);
    
    % Left Surface
    col = 1;
    for row = 2:grid_y-1
        index = ind(row,col);
        num = T_vec(index+1)*(1/dL) + (hok*T_inf); %point to right
        denom = hok + (1/dL);
        T_vec(index) = num/denom;
    end

    % Right Surface
    col = grid_x;
    for row = 2:grid_y-1
        index = ind(row,col);
        num = T_vec(index-1)*(1/dL) + (hok*T_inf); %point to left
        denom = hok + (1/dL);
        T_vec(index) = num/denom;
    end
    
    % Top Surface
    row = grid_y;
    for col = 2:grid_x-1
        index = ind(row,col);
        num = T_vec(index-grid_x)*(1/dL) + (hok*T_inf); %point below
        denom = hok + (1/dL);
        T_vec(index) = num/denom;
    end
end  
    
    % Error
    if time~=0
    diff=abs(T_vec-T_last);
    max_diff = max(diff);
    end
    
    % Do before next step
    T_times(1:nodes,step)=T_vec;
    times(step)=time;
    
    T_last = T_vec;
    
    time = time + dt;
    step = step + 1;
end


%% Helper functions
% Gives the index something has to be placed into in the T_vec (column)
function index = ind(row,col)
        index = (row-1)*grid_x + col;
    end


end