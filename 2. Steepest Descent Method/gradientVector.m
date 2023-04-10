function [z] = gradientVector(xInput, yInput)
    syms x y;
    f = (x^5)*(exp((-(x^2)-(y^2))));
    f1 = gradient(f,[x,y]);
    z = vpa(subs(f1,[x,y],[xInput,yInput]));
end