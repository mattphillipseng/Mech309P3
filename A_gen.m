function A = A_gen(x,y)
    nodes = x*y;
    A = zeros(nodes);
    
    row = 1;
    col = 1;
    while row<=nodes
        while col<=nodes
            if (row~=1) && (row~=y) &&  (col~=1) && (col~=x)%node is not at an edge, node is inside
                A(row,col) = -4; %node we're at
                A(row,col+x) = 1; %for the node above
                A(row,col-x) = 1; %for the node below
                A(row,col+1) = 1; %for the node on right
                A(row,col-1) = 1; %for the node on left
                
            elseif (row==1) %node is at bottom
                A(row,col) = 1;
                
            elseif (row==y) && (col~=1) && (col~=x) %node is at top edge, but not a corner
                
                
            elseif (col==1) && (row~=1) && (row~=y) %node is at a left side edge, but not a corner
                
            elseif (col==x) && (row~=1) && (row~=y)%node is at a right side edge, but not a corner
                
            elseif (row==y) && (col==1) %node is at top left corner
                
            else (row==y) && (col==x) %node is at top right corner
        
            end
            col = col + 1;
        end
        row = row + 1;
    end
end