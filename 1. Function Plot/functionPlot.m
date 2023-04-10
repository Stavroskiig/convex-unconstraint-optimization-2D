% Clear command history and all variables
clear;             
clc; close all;

% Using this function to measure elapsed time.
tic;

% Defining the function under study
syms x y func(x,y)
func(x,y) = (x^5)*(exp((-(x^2)-(y^2))));

% Creating a variable to select which figure to use.
plot_number = 1;


% TASK - Graphing the function

% Graph of our function
figure(plot_number);
%functionMesh = fmesh(func(x,y));
functionSurf = fsurf(func(x,y));
title('3D Plot of: $x^{5} * e^{-x^{2} - y^{2}}$','Interpreter','latex');
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
plot_number = plot_number + 1;
