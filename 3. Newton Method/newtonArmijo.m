function [minValue, minX, minY, flag] = newtonArmijo(f, epsilon, xInput, yInput)

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

flag = 1;

% Implementation of the method.
while ((norm(gradientVector_k) >= epsilon) && (k < maxStep))
    
    h = hessianMatrix(xInput, yInput);

    % The Hessian Matrix should be positive definite. Determinant way.
    if h(1,1) >= 0 || h(1,1) * h(2,2) - h(1,2) * h(2,1) >= 0
        flag = 0;
    end
    % Second way to check if Hessian is positive definite. Eigenvalues way.
    eig_h = eig(h);
    for i = 1:rank(h)
        if eig_h(i) > 0 
            flag = 0;
        end
    end

    d = -(inv(h))' * gradientVector_k;

    [minX(k+1), minY(k+1)] = armijo(f, minX(1), minY(1), d);

    minValue(k+1) = subs(f, [x,y], [minX(k+1), minY(k+1)]);

    gradientVector_k = gradientVector(minX(k+1), minY(k+1));

    k = k+1;

end

end