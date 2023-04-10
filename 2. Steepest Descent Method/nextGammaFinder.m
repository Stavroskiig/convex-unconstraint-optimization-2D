function nextGamma = nextGammaFinder(xInput, yInput, direction, gamma)

syms g
nextX = xInput + g * direction(1);
nextY = yInput + g * direction(2);
nextValue = (nextX^5)*(exp((-(nextX^2)-(nextY^2))));

%  Returns a copy of 'nextValue', replacing all occurrences of 'g' with
% 'gamma'and then evaluates 'nextValue'. Then 'vpa' uses variable-precision
% arithmetic to evaluate each element of the symbolic input to at least d 
% significant digits.
nextGamma = vpa(subs(nextValue,g,gamma));

end