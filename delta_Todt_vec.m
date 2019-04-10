function delta_Todt_vec = delta_Todt_vec(T_vec,grid_x,grid_y,hok)

row=0; %of physical grid
col=0; %of physical grid
dL = 1/(grid_x-1);


% %% Top Surface
% row = grid_y;
% for col = 1:grid_x
%     % edge case
%     index = ind(row,col);
%     num = hok*T_inf + T_vec(index-x)/dL; %point below
%     denom = hok - 1/dL;
%     delta_Todt_vec(index) = num/denom;
%     
% end
% 
% %% Left Surface
% col = 1;
% for row = 2:grid_y-1
%     % edge case
%     index = ind(row,col);
%     num = hok*T_inf + T_vec(index+1)/dL; %point to right
%     denom = hok - 1/dL;
%     delta_Todt_vec(index) = num/denom;
%     
% end
% 
% %% Right Surface
% col = grid_x;
% for row = 2:grid_y-1
%     % edge case
%     index = ind(row,col);
%     num = hok*T_inf + T_vec(index-1)/dL; %point to left
%     denom = hok - 1/dL;
%     delta_Todt_vec(index) = num/denom;
%     
% end

%% Inside Nodes
for row = 2:(grid_y - 1)
    for col = 2:(grid_x - 1)
        % inside case: PDE!!!
        index = ind(row,col);
        
        delta_Todt_vec(index) = T_vec(index) + 
        
        
        
    end
end


%% Helper functions
% Gives the index something has to be placed into in the T_vec
function index = ind(row,col)
        index = (row-1)*grid_x + col;
    end
end