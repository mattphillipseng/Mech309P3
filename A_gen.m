function A = A_gen(x,y,hok,one_ov_delta)
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
                A(row,col) = hok - one_ov_delta;
                A(row,col-x) = one_ov_delta; %col-x gives mult by the physical point below
                
            elseif (col==1) && (row~=1) && (row~=y) %node is at a left side edge, but not a corner
                A(row,col) = hok - one_ov_delta;
                A(row,col+1) = one_ov_delta; %col+1 gives mult by physical point to right
                
            elseif (col==x) && (row~=1) && (row~=y) %node is at a right side edge, but not a corner
                A(row,col) = hok - one_ov_delta;
                A(row,col-1) = one_ov_delta; %col-1 gives mult by physical point to left
                
            elseif (row==y) && (col==1) %node is at top left corner
                A(row,col) = hok - one_ov_delta;
                A(row,col-x) = one_ov_delta/2; %mult by point below
                A(row,col+1) = one_ov_delta/2; %mult by point to right
                
            else (row==y) && (col==x) %node is at top right corner
                A(row,col) = hok - one_ov_delta;
                A(row,col-x) = one_ov_delta/2; %mult by point below
                A(row,col-1) = one_ov_delta/2; %mult by point to left
                
            end
            col = col + 1;
        end
        row = row + 1;
    end
end