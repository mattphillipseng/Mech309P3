function [eig_vec,eig_val] = inv_power_shift(A,vec,mu,tol)

s = size(A);
dim = s(1);

ID = eye(dim);

B = A - mu*ID;

y = vec*(1/norm(vec));


err=1;
max_its = 200;
it=1;
while err > tol && it < max_its
    eig_val_star = y'*A*y;
    
    %Solve Bz=y for z
    z = inv(B)*y;
    
    y = inv(norm(z))*z;
    
    eig_val = y'*A*y;
    err = norm(eig_val-eig_val_star);
    
    it=it+1;
end

eig_vec=y;

end