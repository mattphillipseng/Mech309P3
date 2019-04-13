function [eig_vec,eig_val,mu] = power_method(A,vec,tol)

y = vec*(1/norm(vec));

err = 1;
max_its = 200;
it=1;
while err > tol && it < max_its
    eig_val_star = y'*A*y;
    y = inv(norm(A*y))*A*y;
    eig_val = y'*A*y;
    err = norm(eig_val-eig_val_star);
    
    it=it+1;
end

eig_vec = y;

mu = eig_val + tol;

end