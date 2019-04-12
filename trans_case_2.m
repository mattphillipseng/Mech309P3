function [soln] = trans_case_2(P,D,T_0,C,r)

dt = 10^(-4);
t_max = 4;
times_mat=[0:dt:t_max];
steps = size(times_mat);
num_steps= steps(2);


T_inf = 370;
soln = T_inf*ones(3,num_steps);

soln(:,1)= T_0;


step=2;
for t = dt:dt:t_max
    expod = mat_exponentiation(D,t);
    T = P*expod*inv(P)*(T_0+inv(C)*r)-inv(C)*r;
    
    soln(:,step)=T;
    step=step+1;
end