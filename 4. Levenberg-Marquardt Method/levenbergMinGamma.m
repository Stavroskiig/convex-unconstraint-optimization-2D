function [minValue, minX, minY] = levenbergMinGamma(f, epsilon, xInput, yInput)

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

% Implementation of the method.
while ((norm(gradientVector_k) >= epsilon) && (k < maxStep))
    
    h = hessianMatrix(xInput, yInput);
    
    % Start testing from zero.
    m = 0;

    % Need to find 'm' that makes this matrix positive definite.
    % eye(n) returns an n-by-n identity matrix
    LM = h + m * eye(size(h));

    % Check when LM will be positive definite.
    while LM(1,1) <= 0 || LM(1,1) * LM(2,2) - LM(1,2) * LM(2,1) <= 0

        m = m + 0.5;
        LM = h + m * eye(size(h));

        if m > 1000
            disp('!!SUBTASK 1 - The hessian matrix is not positive definite for any m!!');
            break;
        end

    end

    d = inv(LM) * (-gradientVector_k);
    
    gammaK = goldenSection(xInput, yInput, d);

    minX(k+1) = minX(k) + gammaK * d(1,1);
    minY(k+1) = minY(k) + gammaK * d(2,1);

    minValue(k+1) = subs(f, [x,y], [minX(k+1), minY(k+1)]);

    gradientVector_k = gradientVector(minX(k+1), minY(k+1));

    k = k+1;
end

end