function A = A_gen(x,y,hok,one_ov_delta)
    nodes = x*y;
    A = zeros(nodes);
    
    row = 1 %physical row
    matR = 1 %matrix row
    
    while row<=y
        col = 1; %physical column
        while col<=x
            if (row~=1) && (row~=y) &&  (col~=1) && (col~=x)%node is not at an edge, node is inside
                A(matR,matR) = -4; %node we're at
                A(matR,matR+x) = 1; %for the node above
                A(matR,matR-x) = 1; %for the node below
                A(matR,matR+1) = 1; %for the node on right
                A(matR,matR-1) = 1; %for the node on left
                
            elseif (row==1) %node is at bottom
                A(matR,matR) = 1;
                
            elseif (row==y) && (col~=1) && (col~=x) %node is at top edge, but not a corner
                A(matR,matR) = hok - one_ov_delta;
                A(matR,matR-x) = one_ov_delta; %col-x gives mult by the physical point below
                
            elseif (col==1) && (row~=1) %node is at a left side edge
                A(matR,matR) = hok - one_ov_delta;
                A(matR,matR+1) = one_ov_delta; %col+1 gives mult by physical point to right
                
            else (col==x) && (row~=1) %node is at a right side edge
                A(matR,matR) = hok - one_ov_delta;
                A(matR,matR-1) = one_ov_delta; %col-1 gives mult by physical point to left
                
                
            end
            col = col + 1
            matR = matR + 1
        end
        row = row + 1
    end
end