function [outStruc,generationOut] = TreeGen(start,generationIn,maxGeneration,...
    dist,distVar, aspectRatio,CPorder,samples,numBranches,inStruc)
%TREEGEN Recursive function generating a Bezier curve structure array.
%   Detailed explanation goes here
%    Generate BBang from random dist later
%     global bbList;
persistent struc;
struc = inStruc;
if generationIn > maxGeneration
    generationOut = generationIn;
    outStruc = struc;
    return;
else
    % Bias the angle near 0 degrees (angles can be positive of negative depending on distribution)
    distribution = DistGen(dist, distVar(1), distVar(2));
    BBang = [random(distribution); random(distribution); random(distribution)];
    BB = BBGen(start,BBang,aspectRatio);
    cp = ControlPGen(BB,CPorder,BBang);
    BezCurve = BezierCurve(cp,samples);
    struc(generationIn).curve = cat(3,struc(generationIn).curve,BezCurve);
    for i = 1:numBranches
        % Bias the branch starting location near the end of branch
        startNext = round((1-random(distribution)), 2)*samples;
        startNext = BezCurve(:, startNext);
        [passbackStr,passbackGen] = TreeGen(startNext,generationIn + 1,maxGeneration,dist, distVar,...
            aspectRatio,CPorder,samples,numBranches,struc);
    end
    generationOut = passbackGen;
    outStruc = passbackStr;
    %     outStructure(generationIn) = TreeGen(generationIn + 1)
end


%     l1 = size(bbList,3);
%     bbList = BoundingCheck(bbList,BB);
%     l2 = size(bbList,3);
%     if l1==l2
% %
%     end
end

