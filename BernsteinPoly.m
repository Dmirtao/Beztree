function [bp] = BernsteinPoly(u, k, n)
% BernsteinPoly Returns a Bernstein polynomial of order k, on basis n, evaluated at u
%  ...
% INPUTS:
% u     --  Input vector of values to evaluate
% k     --  Order of calculated polynomial
% n     --  Total degree of polynomial
% OUTPUTS:
% bp    --  Bernstein polynomial vector
% Version 1.0
    bp = (factorial(n)/(factorial(k)*factorial(n-k)))*u.^k.*(1-u).^(n-k);
end