function [outStruc,generationOut,outAR] = TreeGen(start,generationIn,maxGeneration,...
    distAng,distAngVar,distLoc,distLocVar,aspectRatio,CPorder,samples,...
    numBranches,inStruc,bblist,bblistNew,reductionFactor)
%TREEGEN Recursive function generating a Bezier curve structure array.
%   Detailed explanation goes here
%    Generate BBang from random dist later
%     global bbList;

% DEBUG FLAG:
checkBB = false;

persistent struc;
struc = inStruc;
if generationIn > maxGeneration
    generationOut = generationIn;
    outStruc = struc;
    outAR = aspectRatio;
    return;
else
    % Bias the angle near 0 degrees (angles can be positive of negative depending on distribution)
    distributionAng = DistGen(distAng, distAngVar(1), distAngVar(2)); %Check this for correctness
    if generationIn <= 1
%         Angles which align BB to vertical axis
%         xh = [1;0;0]; yh = [0;1;0]; zh = [0;0;1];
%         OP = aspectRatio-start;
%         OQ = [OP(1);OP(2);0];
%         BBang = [acos(dot([0;OP(2);OP(3)],zh)./norm([0;OP(2);OP(3)])); ...
%             acos(dot([OP(1);0;OP(3)],zh)./norm([OP(1);0;OP(3)]));0];
          BBang = [0;0;0];
    else
        BBang = [random(distributionAng); random(distributionAng); randRange(0,2.*pi)];
    end
    % Bounding Box Interference Check
    if checkBB
        while size(bblist, 3) == size(bblistNew, 3)
            BB = BBGen(start,BBang,aspectRatio);
            bblistNew = BoundingCheck(bblist, BB);
            if isempty(bblist) == 1
                break
            end
        end
    else
        BB = BBGen(start,BBang,aspectRatio);
    end
    bblist = bblistNew;
    cp = ControlPGen(BB,CPorder,BBang);
    BezCurve = BezierCurve(cp,samples);
    struc(generationIn).curve = cat(3,struc(generationIn).curve,BezCurve);
    for i = 1:numBranches
        % Bias the branch starting location near the end of branch
        distributionLoc =  DistGen(distLoc, distLocVar(1), distLocVar(2));
        loc = random(distributionLoc);
        if loc > 1
            loc = 0.99;
        elseif loc <= 0
            loc = 0.01;
        end
        decimAR = reductionFactor.*aspectRatio;
        startNext = ceil(loc*samples);
        startNext = BezCurve(:, startNext);
        [passbackStr,passbackGen,passbackAR] = TreeGen(startNext,generationIn + 1,maxGeneration,distAng,...
            distAngVar,distLoc,distLocVar,decimAR,CPorder,samples,numBranches,struc,...
            bblist, bblistNew,reductionFactor); %Recursive call to TreeGen()
    end
    generationOut = passbackGen;
    outStruc = passbackStr;
    outAR = passbackAR;
end
end

