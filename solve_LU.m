function x = solve_LU(b,L,U,nodes)

y = zeros(nodes,1);
x = zeros(nodes,1);
% 
% %% Ly=b
% y(1)=b(1);
% for row = 2:nodes
%     sum = 0;
%     for col = row+1:nodes
%         if L(row,col)~=0
%            sum = sum + L(row,col)*y(col);
%         end
%     end
%     y(row)= b(row)-sum;
% end
% 
% %% Ux=y
% x(nodes)=y(nodes)/U(nodes,nodes);
% for row = nodes-1:-1:1
%     sum = 0;
%     for col = nodes-1:row
%         if L(row,col)~=0
%            sum = sum + L(row,col)*x(col);
%         end
%     end
%     x(row)= (y(row)-sum)/U(row,row);
% end

%% Ly=b
y = inv(L)*b;

%% Ux=y
x = inv(U)*y;



end