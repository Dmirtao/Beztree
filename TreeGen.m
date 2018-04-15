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
    BBang = [random(distributionAng); random(distributionAng)*-pi/2; random(distributionAng)];
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
            loc = 1;
        elseif loc <= 0
            loc = 0.01;
        end
        decimAR = reductionFactor.*aspectRatio;
        startNext = round(loc*samples);
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

