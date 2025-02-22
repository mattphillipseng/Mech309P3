function b = b_gen(grid_x,grid_y,hok,T_b,T_inf,delta)
%% Setup
nodes = grid_x*grid_y;

b = zeros(nodes,1);



%% Bottom surface
row = 1;
x = 0;
for col = 1:grid_x
    temp = T_inf + g(x)*(T_b-T_inf);
    index = ind(row,col);
    b(index) = temp;
    x = x + delta;
end

%% Top Surface
row = grid_y;
for col = 2:grid_x-1
    temp = hok*T_inf;
    index = ind(row,col);
    b(index) = temp;
end

%% Left Surface
col = 1;
for row = 2:grid_y-1
    temp = hok*T_inf;
    index = ind(row,col);
    b(index) = temp;
end

%% Right Surface
col = grid_x;
for row = 2:grid_y-1
    temp = hok*T_inf;
    index = ind(row,col);
    b(index) = temp;
end


%% Helper functions
    function g = g(x)
        g = 1.05*x*(1-x);
    end

    function index = ind(row,col)
        index = (row-1)*grid_x + col;
    end

end