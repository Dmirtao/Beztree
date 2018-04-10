function [outStructure,generationOut] = TreeGen(start,generationIn,maxGeneration,...
    dist,aspectRatio,CPorder,inStructure,samples,numBranches)
%TREEGEN Recursive function generating a Bezier curve structure array.
%   Detailed explanation goes here
%    Generate BBang from random dist later
%     global bbList;
if generationIn > maxGeneration
    outStructure = inStructure;
    generationOut = generationIn;
    return;
else
    %   TODO: Generate weighted random angles using probability dist
    BBang = [pi/6; pi/8; pi/12]; % Placeholder test input
    BB = BBGen(start,BBang,aspectRatio);
    cp = ControlPGen(BB,CPorder,BBang);
    BezCurve = BezierCurve(cp,samples);
    inStructure(generationIn).curve = cat(3,inStructure(generationIn).curve,BezCurve);
    for i = 1:numBranches
        %   TODO: Generate new start points on Bezier curve to feed into recursed, weight randomness
        %   via dist
        start = BezCurve(:,end); %Placeholder test input
        [passbackStructure,passbackGen] = TreeGen(start,generationIn + 1,maxGeneration,dist,...
            aspectRatio,CPorder,inStructure,samples,numBranches);
    end
    outStructure = passbackStructure;
    generationOut = passbackGen;
    %     outStructure(generationIn) = TreeGen(generationIn + 1)
end


%     l1 = size(bbList,3);
%     bbList = BoundingCheck(bbList,BB);
%     l2 = size(bbList,3);
%     if l1==l2
% %
%     end
end

