function cp = ControlPGen(bb,order,bbAng)
% ControlPGen Generates order+1 number of control points within bounding box
%  Creates order+1 number of control points within the bounding box bb
%  with start point at the original corner and ending at the far corner of
%  the bounding box.
% INPUTS:
% bb    --  Bounding box
% order --  Order of BezierCurve
% ang   --  Angles of bounding box
% OUTPUTS:
% cp    --  Control points
% Version 1.0

cp = zeros(3,order+1);
cp(:,1) = [0;0;0];

% Define both the original and inverse rotation matrices
ang = -bbAng;
R_xInv = [1, 0, 0; 0, cos(ang(1)), -sin(ang(1)); 0, sin(ang(1)), cos(ang(1))];
R_yInv = [cos(ang(2)), 0, sin(ang(2)); 0, 1, 0; -sin(ang(2)), 0, cos(ang(2))];
R_zInv = [cos(ang(3)), -sin(ang(3)), 0; sin(ang(3)), cos(ang(3)), 0; 0, 0, 1];

R_x = [1, 0, 0; 0, cos(bbAng(1)), -sin(bbAng(1)); 0, sin(bbAng(1)), cos(bbAng(1))];
R_y = [cos(bbAng(2)), 0, sin(bbAng(2)); 0, 1, 0; -sin(bbAng(2)), 0, cos(bbAng(2))];
R_z = [cos(bbAng(3)), -sin(bbAng(3)), 0; sin(bbAng(3)), cos(bbAng(3)), 0; 0, 0, 1];

% define the overall rotation matrices
R_inv = R_zInv*R_yInv*R_xInv;
R_rot = R_x*R_y*R_z;

% Translate, then rotate bb's ABC to align with
% XYZ, subdivide domains and generate cp, then rotate cp back into original
% bb space.
if order >= 2
    %   Transform to origin
    bbTran = bb - bb(:,1);
    bbRot = R_inv*bbTran;
    bbX = bbRot(1,:);
    bbY = bbRot(2,:);
    bbZ = bbRot(3,:);
    %         Get arrays of subdomains to use as ranges for the rng
    subDomainX = linspace(min(bbX),max(bbX),order);
    subDomainY = linspace(min(bbY),max(bbY),order);
    subDomainZ = linspace(min(bbZ),max(bbZ),order);
    for i = 1:1:order-1
        addX = randRange(subDomainX(i),subDomainX(i+1));
        addY = randRange(subDomainY(i),subDomainY(i+1));
        addZ = randRange(subDomainZ(i),subDomainZ(i+1));
        addedPoint = [addX;addY;addZ];
        cp(:,i+1) = addedPoint;
    end
else
    error(1,'Please choose an order of 2 or more.')
end
cp(:,end) = [max(bbX);max(bbY);max(bbZ)];

% Transform cp back into original bounding box space.
cp = R_rot*cp;
cp = cp + bb(:,1);

return
end

