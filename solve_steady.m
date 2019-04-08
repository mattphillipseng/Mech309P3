function x = solve_steady(grid_x,grid_y,T_b,T_inf,hok)
 
nodes = grid_x*grid_y;

delta = 1/(grid_x-1); %cm
one_ov_delta = 1/delta;

A = A_gen(grid_x,grid_y,hok,one_ov_delta);
b = b_gen(grid_x,grid_y,hok,T_b,T_inf,delta);

[L,U] = LU_decomp(A,nodes);

x = solve_LU(b,L,U,nodes);







end