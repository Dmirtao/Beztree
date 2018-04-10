function [outStructure,generationOut] = TreeGen(start,generationIn,maxGeneration,...
    dist,aspectRatio,CPorder,inStructure,samples)
%TREEGEN Recursive function generating a Bezier curve structure array.
%   Detailed explanation goes here
%    Generate BBang from random dist later
%     global bbList;
    BBang = [pi/6; pi/8; pi/12]; % Placeholder test input
    BB = BBGen(start,BBang,aspectRatio);
    cp = ControlPGen(BB,CPorder,BBang);
    BezCurve = BezierCurve(cp,samples);
    
%     l1 = size(bbList,3);
%     bbList = BoundingCheck(bbList,BB);
%     l2 = size(bbList,3);
%     if l1==l2
% %      
%     end
end

