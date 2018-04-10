function BoundingBox = BBGen(xyz, ang, dim)
% BBGen Outputs bounding box origin then three normal vectors defining the edges from the origin
% A function that outputs three vectors that fully define the
% bounding box. These vectors correspond to the length, width, depth of the
% bounding box. the xyz input correzsponds to the location of the origin of 
% the bounding box. The ang input corresponds to the local coordinate frame
% of the bounding box. the dim input are the dimensions of the bounding box
% [length; width; depth]
% INPUTS:
%   xyz     -- vector of the x, y, and z coordinates of the corner of
%   bounding box.
%
%   ang     -- vector of the rotation angles about the x, y, and z axis
%   respectively.
%   
%   dim     -- vector of the lengths along the rotated x, y, and z
%   direction of the bounding box.
%
% OUTPUTS:
%   boundingBox     -- a 3X4 matrix. First rows correspond to x, y, z while
%   columns are the origin in the first column, and then the three vectors decribing sides of
%   box in the remaining 3 columns.
%
%   ang     -- the same vector as the input ang.

% test inputs [3; 4; 5], [pi/6, pi/6, pi/6], [3, 4, 5]
%   Define an origin and the three direction vectors in the glodal coordinate space
    BoundingBox=[0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
%   This is a cube with origin <0, 0, 0> and side lengths of 1
    
    % Define the rotation matrices for all axes
    R_x = [1, 0, 0; 0, cos(ang(1)), -sin(ang(1)); 0, sin(ang(1)), cos(ang(1))];
    R_y = [cos(ang(2)), 0, sin(ang(2)); 0, 1, 0; -sin(ang(2)), 0, cos(ang(2))];
    R_z = [cos(ang(3)), -sin(ang(3)), 0; sin(ang(3)), cos(ang(3)), 0; 0, 0, 1];
    % Define the overall rotation matrix
    R_total = R_x*R_y*R_z;
    
%   Loop through trhe bounding cube and rotate each vector that determines
%   the sides of the cube and then scale the sides with the input dim.
    for i = 2:4
        BoundingBox(:, i) = dim.*R_total*BoundingBox(:, i);
    end
    BoundingBox = BoundingBox+xyz;
end

