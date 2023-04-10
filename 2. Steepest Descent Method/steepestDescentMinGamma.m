function [minValue, minX, minY] = steepestDescentMinGamma(f, epsilon, xInput, yInput)

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
minValue(k) = subs(f, [x,y], [minX(1),minY(1)]);

% Calculate the gradient vector at the current point.
gradientVector_k = gradientVector(minX(k), minY(k));

% Implementation of the method. We use the 'goldenSection' function to
% select the ideal 'g' = 'gamma'.
while ((norm(gradientVector_k) >= epsilon) && (k < maxStep))
    d = - gradientVector(minX(k), minY(k));
    gamma_k = goldenSection(xInput, yInput, d);
    minX(k+1) = minX(k) + gamma_k * d(1,1);
    minY(k+1) = minY(k) + gamma_k * d(2,1);
    gradientVector_k = gradientVector(minX(k+1), minY(k+1));
    minValue(k+1) = subs(f, [x,y], [minX(k+1), minY(k+1)]);
    k = k + 1;
end

end

