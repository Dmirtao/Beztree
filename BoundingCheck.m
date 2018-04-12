function [bblistNew] = BoundingCheck(bblist, BoundingBox2)
%BoundingCheck
% A function will ensure that the newly created bounding box does not
% interfere with an existing bounding box. If the newly generated one
% interferes the function will return and need to be called again. If the
% newly formed bounding box does not interfere, then the new bounding box
% will be added to bblist a 3D matrix with depth corresponding to the
% bounding boxes on the tree. This function is based of the Separating Axis
% Test, a test to check for collisions between objects that are not convex in shape.
%
% For more on separating axis theorem, visit the following paper on the Separating Axis Theorem:
% http://www.jkh.me/files/tutorials/Separating%20Axis%20Theorem%20for%20Oriented%20Bounding%20Boxes.pdf
%...
% INPUTS:
%   bblist     -- 3X4X(number of bounding boxes) matrix of the bounding boxes that currently exist 
%   (rows and columns correspond to each BBGen output while the depth corresponds to each bounding 
%   box that is on the tree).
%
%   BoundingBox2     -- is the newly formed bounding box in question
%
% OUTPUTS:
%   bblistNew     -- a 3X4X(number of bounding boxes) matrix of the bounding boxes that exist after 
%   running this function(rows and columns correspond to each BBGen output while the depth 
%   corresponds to each bounding box that is on the tree).

%Test Inputs for no Interference
% bblist = BBGen([3; 4; 5], [pi/6, pi/6, pi/6], [3, 4, 5]);
% BoundingBox2 = BBGen([2; 2; 2], [pi/3, pi/3, pi/3], [3, 3, 3]);
%Test Inputs for Interference
% bblist = BBGen([3; 4; 5], [pi/6, pi/6, pi/6], [3, 4, 5]);
% BoundingBox2 = BBGen([4; 5; 6], [pi/3, pi/3, pi/3], [3, 3, 3]);

%import each bounding box from bblist one at a time and the newly formed bounding box for testing
tic
%find vertices of bounding box 2
a2 = BoundingBox2(:, 1);
b2 = BoundingBox2(:, 2);
c2 = BoundingBox2(:, 3);
d2 = BoundingBox2(:, 4);
l2 = (b2-a2)+(c2-a2)+a2;
j2 = (b2-a2)+(d2-a2)+a2;
k2 = (d2-a2)+(c2-a2)+a2;
i2 = (l2-b2)+(j2-b2)+b2;
box2 = [a2, b2, c2, d2, i2, j2, k2, l2];

%import each bounding box from bblist one at a time and compare to
%BouundingBox2
check = 0;
D = size(bblist, 3);
for i =1:D
    BoundingBox1 = bblist(:, :, i);
    %find vertices of bounding box from bblist
    a1 = BoundingBox1(:, 1);
    b1 = BoundingBox1(:, 2);
    c1 = BoundingBox1(:, 3);
    d1 = BoundingBox1(:, 4);
    l1 = (b1-a1)+(c1-a1)+a1;
    j1 = (b1-a1)+(d1-a1)+a1;
    k1 = (d1-a1)+(c1-a1)+a1;
    i1 = (l1-b1)+(j1-b1)+b1;
    box1 = [a1, b1, c1, d1, i1, j1, k1, l1];

    %find local axes for both boxes and project all vertices from both
    %boxes to these local axes and check for overlap of projections
    %for box1 local axes 
    x1 = b1-a1;
    y1 = c1-a1;
    z1 = d1-a1;
    proj_1_x1 = [dot(a1, x1), dot(b1, x1), dot(c1, x1), dot(d1, x1), dot(i1, x1), dot(j1, x1), dot(k1, x1), dot(l1, x1)];
    proj_1_y1 = [dot(a1, y1), dot(b1, y1), dot(c1, y1), dot(d1, y1), dot(i1, y1), dot(j1, y1), dot(k1, y1), dot(l1, y1)];
    proj_1_z1 = [dot(a1, z1), dot(b1, z1), dot(c1, z1), dot(d1, z1), dot(i1, z1), dot(j1, z1), dot(k1, z1), dot(l1, z1)];
    proj_2_x1 = [dot(a2, x1), dot(b2, x1), dot(c2, x1), dot(d2, x1), dot(i2, x1), dot(j2, x1), dot(k2, x1), dot(l2, x1)];
    proj_2_y1 = [dot(a2, y1), dot(b2, y1), dot(c2, y1), dot(d2, y1), dot(i2, y1), dot(j2, y1), dot(k2, y1), dot(l2, y1)];
    proj_2_z1 = [dot(a2, z1), dot(b2, z1), dot(c2, z1), dot(d2, z1), dot(i2, z1), dot(j2, z1), dot(k2, z1), dot(l2, z1)];
    min1x1 = min(proj_1_x1);
    max1x1 = max(proj_1_x1);
    min1y1 = min(proj_1_y1);
    max1y1 = max(proj_1_y1);
    min1z1 = min(proj_1_z1);
    max1z1 = max(proj_1_z1);
    min2x1 = min(proj_2_x1);
    max2x1 = max(proj_2_x1);
    min2y1 = min(proj_2_y1);
    max2y1 = max(proj_2_y1);
    min2z1 = min(proj_2_z1);
    max2z1 = max(proj_2_z1);
    %for box2 local axes
    x2 = b2-a2;
    y2 = c2-a2;
    z2 = d2-a2;
    proj_1_x2 = [dot(a1, x2), dot(b1, x2), dot(c1, x2), dot(d1, x2), dot(i1, x2), dot(j1, x2), dot(k1, x2), dot(l1, x2)];
    proj_1_y2 = [dot(a1, y2), dot(b1, y2), dot(c1, y2), dot(d1, y2), dot(i1, y2), dot(j1, y2), dot(k1, y2), dot(l1, y2)];
    proj_1_z2 = [dot(a1, z2), dot(b1, z2), dot(c1, z2), dot(d1, z2), dot(i1, z2), dot(j1, z2), dot(k1, z2), dot(l1, z2)];
    proj_2_x2 = [dot(a2, x2), dot(b2, x2), dot(c2, x2), dot(d2, x2), dot(i2, x2), dot(j2, x2), dot(k2, x2), dot(l2, x2)];
    proj_2_y2 = [dot(a2, y2), dot(b2, y2), dot(c2, y2), dot(d2, y2), dot(i2, y2), dot(j2, y2), dot(k2, y2), dot(l2, y2)];
    proj_2_z2 = [dot(a2, z2), dot(b2, z2), dot(c2, z2), dot(d2, z2), dot(i2, z2), dot(j2, z2), dot(k2, z2), dot(l2, z2)];
    min1x2 = min(proj_1_x2);
    max1x2 = max(proj_1_x2);
    min1y2 = min(proj_1_y2);
    max1y2 = max(proj_1_y2);
    min1z2 = min(proj_1_z2);
    max1z2 = max(proj_1_z2);
    min2x2 = min(proj_2_x2);
    max2x2 = max(proj_2_x2);
    min2y2 = min(proj_2_y2);
    max2y2 = max(proj_2_y2);
    min2z2 = min(proj_2_z2);
    max2z2 = max(proj_2_z2);

    %Compare with if statement to check for interference by checking if all theprojections 
    %from one box overlap with the other box for all six axes
    if min2x1 < max1x1 && max2x1 > min1x1 && min2y1 < max1y1 && max2y1 > min1y1 && ...
            min2z1 < max1z1 && max2z1 > min1z1 && min2x2 < max1x2 && max2x2 > min1x2 && ...
            min2y2 < max1y2 && max2y2 > min1y2 && min2z2 < max1z2 && max2z2 > min1z2
        check = check + 1;
    end
    
    %If new bounding box does not interfere with any bounding boxes in bblist, store the new 
    %box in bblist. If new bounding box interferes with any bounding boxes in bblist, return 
    %and do not add the new bounding box to bblist.

% % % UNCOMMENT to plot
% %
% t = linspace(0, 1, 50);
% %plot box 1
% % find edges for box 1 (plotting only)
% ab1 = (b1-a1).*t + a1;
% ac1 = (c1-a1).*t + a1;
% cl1 = (l1-c1).*t + c1;
% bl1 = (l1-b1).*t + b1;
% dk1 = (k1-d1).*t + d1;
% ki1 = (i1-k1).*t + k1;
% ij1 = (j1-i1).*t + i1;
% dj1 = (j1-d1).*t + d1;
% bj1 = (j1-b1).*t + b1;
% ad1 = (d1-a1).*t + a1;
% ck1 = (k1-c1).*t + c1;
% li1 = (i1-l1).*t + l1;
% figure(1)
% hold on
% scatter3(BoundingBox1(1, :), BoundingBox1(2, :), BoundingBox1(3, :), 'r')
% scatter3(ab1(1, :), ab1(2, :), ab1(3, :), 'r')
% scatter3(ac1(1, :), ac1(2, :), ac1(3, :), 'r')
% scatter3(cl1(1, :), cl1(2, :), cl1(3, :), 'r')
% scatter3(bl1(1, :), bl1(2, :), bl1(3, :), 'r')
% scatter3(dk1(1, :), dk1(2, :), dk1(3, :), 'r')
% scatter3(ki1(1, :), ki1(2, :), ki1(3, :), 'r')
% scatter3(ij1(1, :), ij1(2, :), ij1(3, :), 'r')
% scatter3(dj1(1, :), dj1(2, :), dj1(3, :), 'r')
% scatter3(bj1(1, :), bj1(2, :), bj1(3, :), 'r')
% scatter3(ad1(1, :), ad1(2, :), ad1(3, :), 'r')
% scatter3(ck1(1, :), ck1(2, :), ck1(3, :), 'r')
% scatter3(li1(1, :), li1(2, :), li1(3, :), 'r')
% %plot box 2
% % find edges for box 2 (plotting only)
% ab2 = (b2-a2).*t + a2;
% ac2 = (c2-a2).*t + a2;
% cl2 = (l2-c2).*t + c2;
% bl2 = (l2-b2).*t + b2;
% dk2 = (k2-d2).*t + d2;
% ki2 = (i2-k2).*t + k2;
% ij2 = (j2-i2).*t + i2;
% dj2 = (j2-d2).*t + d2;
% bj2 = (j2-b2).*t + b2;
% ad2 = (d2-a2).*t + a2;
% ck2 = (k2-c2).*t + c2;
% li2 = (i2-l2).*t + l2;
% scatter3(BoundingBox2(1, :), BoundingBox2(2, :), BoundingBox2(3, :), 'b')
% scatter3(ab2(1, :), ab2(2, :), ab2(3, :), 'b')
% scatter3(ac2(1, :), ac2(2, :), ac2(3, :), 'b')
% scatter3(cl2(1, :), cl2(2, :), cl2(3, :), 'b')
% scatter3(bl2(1, :), bl2(2, :), bl2(3, :), 'b')
% scatter3(dk2(1, :), dk2(2, :), dk2(3, :), 'b')
% scatter3(ki2(1, :), ki2(2, :), ki2(3, :), 'b')
% scatter3(ij2(1, :), ij2(2, :), ij2(3, :), 'b')
% scatter3(dj2(1, :), dj2(2, :), dj2(3, :), 'b')
% scatter3(bj2(1, :), bj2(2, :), bj2(3, :), 'b')
% scatter3(ad2(1, :), ad2(2, :), ad2(3, :), 'b')
% scatter3(ck2(1, :), ck2(2, :), ck2(3, :), 'b')
% scatter3(li2(1, :), li2(2, :), li2(3, :), 'b')

end

if check > 1
    disp('-Too Much Interference Detected-')
    bblistNew = bblist;
    return % COMMENT if you want to plot
%         break %UNCOMMENT if you want to plot
else
    disp('---  Acceptable Interference Detected  ---')
    bblistNew = cat(3, bblist, BoundingBox2);
end
toc

end

