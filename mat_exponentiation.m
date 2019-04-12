function new_mat = mat_exponentiation(D_mat,t)
% gives e^(D_mat*t)

s=size(D_mat);
row_elems = s(1);
col_elems = s(2);

for row = 1:row_elems
    for col = 1:col_elems
        D_mat(row,col) = exp(1)^(D_mat(row,col)*t);
    end
end
new_mat=D_mat;