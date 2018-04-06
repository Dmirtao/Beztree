function BezCu = BezierCurve(cp, num)
% BezierCurve Returns a Bezier curve evaluating control points cp, evaluated for num points
%  ...
% INPUTS:
% cp     --  Input vector of values to evaluate
% num    --  Order of calculated polynomial
% OUTPUTS:
% BezCu  --  Bezier curve 
% Version 1.0

    h = size(cp);
    h1 = h(1);
    n = h(2);
    u = linspace(0,1,num);
    BezCu = zeros(h1,num);
    for i = 1:n
        for j = 1:h1
            BezCu(j, :) = BernsteinPoly(u,i-1,n-1) * cp(j,i) + BezCu(j,:);
        end
    end
end