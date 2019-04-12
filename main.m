%% MECH 309 Final Project

% Modified by Matthew Phillips
% Student ID: 260689202

% Modified by Jarred Brown
% Student ID: 260688463

close all
clear all
clc

% Format of output
    format short
    %format long

%% Input Grid Size
grid_x = 3; %m, num nodes on x
grid_y = 5; %n, num nodes on y

nodes = grid_x*grid_y;

delta = 1/(grid_x-1); %cm
one_ov_delta = 1/delta;

%% Input BCs
T_b = 420; %Kelvin
T_inf = 370; %Kelvin

%% Input Constants
h = 5/(100*100); %heat transfer coefficient of air [W/cm^2-K]
k = 413/100; %thermal conductivity of fin material (Copper) [W/cm-K]

hok = h/k;

if false
%% Manual Input Method
A = A_gen(grid_x,grid_y,hok,one_ov_delta);
b = b_gen(grid_x,grid_y,hok,T_b,T_inf,delta);

[L,U] = LU_decomp(A,nodes);

x = solve_LU(b,L,U,nodes);


%% Plotting steady state
[S1,S2,S3,S4,p2b_table] = get_solns(T_b,T_inf,hok);
plot2a(S1,S2,S3,S4);
heat_plots(S1,S2,S3,S4);
end

if true
%% Transient
[transient_euler,times_euler] = transient_euler(grid_x,grid_y,T_b,T_inf,hok,k);
plot_transient(transient_euler,times_euler);




end
