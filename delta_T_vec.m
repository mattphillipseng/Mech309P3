function delta_T_vec = delta_T_vec(T_vec,grid_x,grid_y)

row=0;
col=0;

%% Bottom surface - Can delete this, we will get all temps for the bottom at once
row = 1;
x = 0;
for col = 1:grid_x
    %use bottom_T_transient
end

%% Top Surface
row = grid_y;
for col = 1:grid_x
    % edge case
end

%% Left Surface
col = 1;
for row = 2:grid_y-1
    % edge case
end

%% Right Surface
col = grid_x;
for row = 2:grid_y-1
    % edge case
end

%% Inside Nodes
for row = 2:(grid_y - 1)
    for col = 2:(grid_x - 1)
        % inside case: PDE!!!
    end
end


%% Helper functions
% Gives the index something has to be placed into in the T_vec
function index = ind(row,col)
        index = (row-1)*grid_x + col;
    end
end