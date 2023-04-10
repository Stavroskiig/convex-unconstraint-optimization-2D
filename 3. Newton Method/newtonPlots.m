% Removes all variables from the currently active workspace.
clearvars

% Clears all the text from the Command Window.
clc

% Choose epsilon.
epsilon = 0.001;

% Chooses the preferable point
choosePoint = 2;

% The three points under study.
xInput = [0, -1, 1];
yInput = [0, 1, -1];

% Creates symbolic scalar variables 'x' and 'y'.
syms x y

% Define my function.
f(x,y) = (x^5)*(exp((-(x^2)-(y^2))));


%% SUBTASK 1 - Keeping the gammaK step constant.

% Using this function to measure elapsed time.
tic;

% Using this var to check the Hessian Matrix's positive definition.
flag1 = 0;

% Calling the method for constant gamma.
[~, xValue1, yValue1, flag1] = newtonConstGamma(f, epsilon, xInput(choosePoint), yInput(choosePoint));

% Ensure that Hessian was positive definite.
if flag1 == 1
    disp('!!SUBTASK 1 - The Hessian Matrix is not positive definite!!');
end

% Creating a variable to select which figure to use.
plot_number = 1;

% Plotting the convergence of our points.
figure(plot_number);
clf
functionContour = fcontour((f),[-3, 3]);
functionContour.LineWidth = 2;
hold on
scatter(xValue1, yValue1,'+', "red")
hold on 
scatter(xValue1(end), yValue1(end), "pentagram", "black")
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{5} * e^{-x^{2} - y^{2}}$ with steps for Newton Method for gamma = 1 for (1,-1)','Interpreter','latex')
plot_number = plot_number + 1;

% Using this function to measure elapsed time.
toc;

%% SUBTASK 2 - Selecting gamma_k that minimizes f(x_k + gamma_k * direction_k).

% Using this function to measure elapsed time.
tic;

% Using this var to check the Hessian Matrix's positive definition.
flag2 = 0;

% Calling the method for constant gamma.
[~, xValue2, yValue2, flag2] = newtonMinGamma(f, epsilon, xInput(choosePoint), yInput(choosePoint));

% Ensure that Hessian was positive definite.
if flag2 == 1
    disp('!!SUBTASK 2 - The Hessian Matrix is not positive definite!!');
end

% Plotting the convergence of our points.
figure(plot_number);
clf
functionContour = fcontour((f),[-3, 3]);
functionContour.LineWidth = 2;
hold on
scatter(xValue2, yValue2,'+', "red")
hold on 
scatter(xValue2(end), yValue2(end), "pentagram", "black")
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{5} * e^{-x^{2} - y^{2}}$ with steps for Newton Method for ideal gamma for (1,-1)','Interpreter','latex')
plot_number = plot_number + 1;

% Using this function to measure elapsed time.
toc;

%% SUBTASK 3 - Selecting gamma_k according Armijo rule.

% Using this function to measure elapsed time.
tic;

% Using this var to check the Hessian Matrix's positive definition.
flag3 = 0;

% Calling the method for constant gamma.
[~, xValue3, yValue3, flag3] = newtonArmijo(f, epsilon, xInput(choosePoint), yInput(choosePoint));

% Ensure that Hessian was positive definite.
if flag3 == 1
    disp('!!SUBTASK 3 - The Hessian Matrix is not positive definite!!');
end

% Plotting the convergence of our points.
figure(plot_number);
clf
functionContour = fcontour((f),[-3, 3]);
functionContour.LineWidth = 2;
hold on
scatter(xValue3, yValue3,'+', "red")
hold on 
scatter(xValue3(end), yValue3(end), "pentagram", "black")
legend('z','steps','final solution')
xlabel('x')
ylabel('y')
title('z = $x^{5} * e^{-x^{2} - y^{2}}$ with steps for Newton Method for Armijo rule gamma for (1,-1)','Interpreter','latex')
plot_number = plot_number + 1;

% Using this function to measure elapsed time.
toc;