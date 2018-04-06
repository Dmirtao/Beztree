function  PlotAll(xyz, ang, dim, order, num)
%UNTITLED2 Summary of this function goes here
%   Plot Everything We Got On One Graph!
%...
% INPUTS:
%   xyz     -- vector of the x, y, and z coordiantes of the corner of
%   bounding box.
%
%   ang     -- vector of the roatation angles about the x, y, and z axis
%   respectively.
%   
%   dim     -- vector of the lengths along the rotated x, y, and z
%   direction of the bounding box.
%
%   order   --  Order of BezierCurve
%
%   num     -- number of diecrete points that make up Bezier Curve
% 
% TEST INPUTS USED:
%       [3; 4; 5], [pi/6, pi/6, pi/6], [10, 10, 10], 7, 400



close all; clc
[BoundingBox, ang] = BBGen(xyz, ang, dim)
cp = ControlPGen(BoundingBox,order,ang)
BezCu = BezierCurve(cp, num)
figure(1)
hold on
scatter3(BoundingBox(1, :), BoundingBox(2, :), BoundingBox(3, :), '*')
scatter3(cp(1, :), cp(2, :), cp(3, :), 'o', 'MarkerEdgeColor', 'r', 'MarkerFaceColor', 'r')
scatter3(BezCu(1, :), BezCu(2, :), BezCu(3, :), '.')
end

