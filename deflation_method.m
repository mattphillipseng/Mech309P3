function [P,D] = deflation_method(A)

s = size(A);
dim = s(1);

% Pre-allocate
P = zeros(dim);
D = zeros(dim);

vec = [2;3;4]; %random
tol = 10^(-9);

%% Step 1
[vec_1,e_1,mu] = power_method(A,vec,tol);

%% Step 2
B1 = A;
u1 = vec_1;

D(1,1) = e_1;
P(:,1) = vec_1;


%% Loop

for lv1 = 2:(dim)
    % Step 3
    B2 = B1 - e_1*u1*u1';
    
    % Step 4
    [vec_2,e_2,mu] = power_method(B2,u1,tol);
    
    % Step 5
    [v2,e_21] = inv_power_shift(A,vec,mu,tol);
    
    % Step 6
    B1 = B2;
    u1 = v2;
    e_1 = e_2;
    
    D(lv1,lv1) = e_2;
    P(:,lv1) = -v2;
    
    
end
%P(:,1) = -1*P(:,1);








end