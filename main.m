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
% ONLY USE EVEN GRIDS!!! x=1cm, y=2cm
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

%% Steady State
want_to_do_steady_state = true; % INPUT
if want_to_do_steady_state

% Manual Input Method
A = A_gen(grid_x,grid_y,hok,one_ov_delta);
b = b_gen(grid_x,grid_y,hok,T_b,T_inf,delta);
[L,U] = LU_decomp(A,nodes);
x = solve_LU(b,L,U,nodes);


%% Plotting steady state
[S1,S2,S3,S4,p2b_table] = get_solns(T_b,T_inf,hok);
plot2a(S1,S2,S3,S4);
heat_plots(S1,S2,S3,S4);
end


%% Transient Case 1
want_to_do_transient = true; % INPUT
if want_to_do_transient

% Problem 1
[transient_euler_3x5,times_euler_3x5] = transient_euler(3,5,T_b,T_inf,hok,k,4);
[transient_rk2_3x5,times_rk2_3x5] = transient_rk2(3,5,T_b,T_inf,hok,k,4);

plot_transient_1(transient_euler_3x5,times_euler_3x5,transient_rk2_3x5,times_rk2_3x5);

% Problem 2
tic;
[transient_euler_16x31,times_euler_16x31] = transient_euler(16,31,T_b,T_inf,hok,k,4);
t_euler_16x31 = toc;

tic;
[transient_rk2_16x31,times_rk2_16x31] = transient_rk2(16,31,T_b,T_inf,hok,k,4);
t_rk2_16x31 = toc;

plot_transient_16x31(transient_euler_16x31,times_euler_16x31,transient_rk2_16x31,times_rk2_16x31)

% Problem 3
% Doing on a 16x31 grid
[t_inf_euler,times_inf_euler] = transient_euler(16,31,T_b,T_inf,hok,k,20);
[t_inf_rk2,times_inf_rk2] = transient_rk2(16,31,T_b,T_inf,hok,k,20);
% TODO plot
plot_transient_inf(t_inf_euler,times_inf_euler,t_inf_rk2,times_inf_rk2)



%% Transient Case 2







end
