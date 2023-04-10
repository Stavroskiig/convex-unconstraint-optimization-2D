function [xNext, yNext] = armijo(f, xInput,yInput,direction)
    s = 1; 

    % 'a' should be in the range of (0.1 , 0.00001)
    a = 0.01; 

    % 'b' should be in the range of (0.1 , 0.5)
    b = 0.4;

    % We start with m=0 according to the book.
    m = 0;
    
    % We calculate the step.
    gamma_k = s * b^m;

    % Calculate the new cordinates for the new step value.
    xNext = xInput + gamma_k * direction(1,1);
    yNext = yInput + gamma_k * direction(2,1);

    % Creates symbolic scalar variables 'x' and 'y'.
    syms x y;

    % Calculate the first minimum value.
    oldValue = subs(f, [x,y], [xInput, yInput]);

    % Calculate the second minimum value.
    newValue = subs(f, [x,y], [xInput, yInput]);
    
    % Calculate the gradient vector at the current point.
    gradientVector_k = gradientVector(xInput, yInput);

    while ((oldValue - newValue) < (-a * (b^m) * s * direction' * gradientVector_k))
        m = m + 1;
        gamma_k = s * b^m;
        xNext = xInput + gamma_k * direction(1,1);
        yNext = yInput + gamma_k * direction(2,1);
        newValue = (xNext^5)*(exp((-(xNext^2)-(yNext^2))));
        gradientVector_k = gradientVector(xInput, yInput);
    end
end
