function [minValue, minX, minY] = steepestDescentArmijo (f, epsilon, xInput, yInput)

% The variable 'k' shows in which iteration we are in
k = 1;

% The variable 'maximumStep' determines the maximum possible steps
maxStep = 100;

% Initialize the cordinates arrays with zeros.
minX = zeros();
minY = zeros();

% Setting the starting (x,y) point to the first array indexes.
minX(1) = xInput;
minY(1) = yInput;

% Creates symbolic scalar variables 'x' and 'y'.
syms x y;

% Setting the first detected minimum value in the array.
minValue(1) = subs(f, [x,y], [minX(1),minY(1)]);

% Calculate the gradient vector at the current point.
gradientVector_k = gradientVector(minX(k), minY(k));


% In each iteration we move to the direction of 'd' with 'gamma' for step.
% The value of 'gamma', is calculated according to Armijo rule.
%I initialize g=1.5, in order that 
%at the beginning, i shall make bigger steps. As i move closer to 
%the mininum, i want to make smaller steps, so i reduce g, g =g-0.1g.
%If the value of g is lesser than 0.0008, i triple g, so that i avoid
%oscillations and really small steps.
while (((norm(gradientVector_k)) >= epsilon) && (k < maxStep))
    d = - gradientVector(minX(k), minY(k));
    [minX(k+1), minY(k+1)] = armijo(f,minX(1), minY(1), d);
    gradientVector_k = gradientVector(minX(k+1), minY(k+1));
    minValue(k+1) = subs(f, [x,y], [minX(k+1), minY(k+1)]);
    k = k + 1;
end

end