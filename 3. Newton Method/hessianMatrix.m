function h = hessianMatrix(xInput, yInput)
    syms x y;
    f = (x^5)*(exp((-(x^2)-(y^2))));
    f1 = hessian(f,[x,y]);
    h = vpa(subs(f1,[x,y],[xInput,yInput]));
end