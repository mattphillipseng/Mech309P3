%% MECH 309 Final Project

% Modified by Matthew Phillips
% Student ID: 260689202

% Modified by Jarred Brown
% Student ID: 260688463

close all
clear all
clc

% Format of output
    % format short
    format long

%% Input Variables
grid_x = 3; %m, num nodes
grid_y = 5; %n, num nodes

T_b = 420 %Kelvin
T_inf = 370 %Kelvin

h = 15; %heat transfer coefficient of air ********UNITS???**********
k = 413/100 %thermal conductivity of fin [W/cm-K]


%% Method
A = A_gen(grid_x,grid_y)