% Main script wrapper for TreeGen
clear; clc; close all;

start = [0;0;0];
maxGen = 3;
CPorder = 4;
% 
aspectRatio = [3;4;1];
dist = 'Beta';
distVar = [2, 5];
samp = 100;
numBranches = 5;
% for i = 1:maxBranch
firstStruc(maxGen) = struct('curve',[]);
% end
[BezStructure,generationOut] = TreeGen(start,1,maxGen,dist,distVar,aspectRatio, ...
    CPorder,samp,numBranches,firstStruc);

