function [L,U] = LU_decomp(U,nodes) %Inputting U here because we iterate from A to get it

L = eye(nodes);


for col = 1:nodes %iterate through each column
    for row = (col+1):nodes %start at the row below the diagonal
        if U(row,col)~=0
            m = U(row,col)/U(col,col);
            L(row,col) = m;
            
            U(row,col)=0; %set it to 0 to avoid a subtraction
            
            % update the whole row
            for col_iter = col+1:nodes
                if U(col,col_iter)~=0
                    U(row,col_iter) = U(row,col_iter) - m*U(col,col_iter);
                end
            end
        end
    end
end

end