function [bottom_Ts] = bottom_T_transient(grid_x,t,T_b,T_inf)
% Gives the temps of the nodes at the bottom at a certain point in time.


delta = 1/(grid_x-1);
bottom_Ts = zeros(grid_x,1);

x = 0;
for node = 1:grid_x
    bottom_Ts(node) = T_inf + g(x,t)*(T_b-T_inf);
    x = x+delta;
end


    
    
    
%% Helper functions
    function g = g(x,time)
        phi = 0;
        if time<=2
            phi = 1 + 0.05*sin(10*pi*time);           
        else
            phi = 0.05*exp(1)^(-0.5*(time-2)) + 0.95;
        end
        g = 1.05*x*(1-x)*phi;
    end


    
end