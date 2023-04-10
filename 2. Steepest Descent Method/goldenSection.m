function [minGamma] = goldenSection(xInput, yInput, direction)

% Determining the precision we want.
lambda = 0.01;

% Determining the interval to search for the minimum
alpha = -5;
beta = 5;

% This is the golden ratio number.
gamma = 0.618;

% Assign the starting values of the x1, x2
x1 = alpha + (1 - gamma) * (beta - alpha);
x2 = alpha + (gamma) * (beta - alpha);

% Determine the starting values of the fx1, fx2.
fx1 = nextGammaFinder(xInput, yInput, direction, x1);
fx2 = nextGammaFinder(xInput, yInput, direction, x2);

% Implementation of the method.
while (beta - alpha >= lambda)

    if fx1 <= fx2
        beta = x2;
        x2 = x1;
        x1 = alpha + (1 - gamma) * (beta - alpha);
        fx2 = fx1;  
        fx1 = nextGammaFinder(xInput, yInput, direction, x1);
    else
        alpha = x1;
        x2 = alpha + (gamma) * (beta - alpha);
        x1 = x2;
        fx1 = fx2;
        fx2 = nextGammaFinder(xInput, yInput, direction, x1);
    end

end

minGamma = (alpha + beta)/2;

end