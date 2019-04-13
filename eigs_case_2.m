function [defl_P,defl_D,eig_P,eig_D,T_0,C_mat,r_mat] = eigs_case_2

T_b = 420;
T_inf = 370;
h = 5/(100*100); %heat transfer coefficient of air [W/cm^2-K]
k = 413/100; %thermal conductivity of fin material (Copper) [W/cm-K]
rho = 8.96; % Density, [kg/cm^3]
C_p = 0.39; % Heat capacity at const pressure. [kJ/kg-K]
dL = 0.5;

gamma = k/(rho*C_p*(dL^2));
omega1 = (1/dL)/( (1/dL)+(h/k) );
omega2 = ((h/k)*T_inf)/( (1/dL)+(h/k) );
gx = 1.05*0.5*(1-0.5);
sigma = T_inf + gx*(T_b - T_inf);

C_mat = gamma*[
    (-4+2*omega1), 1, 0;
    1, (-4+2*omega1), 1;
    0, 1, (-4+3*omega1);
];

r_mat = gamma*[(2*omega2)+sigma ; 2*omega2; 3*omega2];

T_0 = [T_inf;T_inf;T_inf];
%T_soln = T_0;

%% Find eigs manually
[defl_P,defl_D] = deflation_method(C_mat);


%% Find eigs using built in function
[eig_P,eig_D] = eig(C_mat);







end
