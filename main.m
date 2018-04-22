% Main script wrapper for TreeGen
clear; clc; close all;

start = [0;0;0];
maxGen = 7;
CPorder = 11;
rng('shuffle');

% 
aspectRatio = [1;1;10];
reductionFactor = 0.7;  % Ratio of how much the aspect ratio is decimated each generation.
distAng = 'Normal';
distAngVar = [0, 0.3]; % mean, stdev
distLoc = 'Normal';
distLocVar = [.8, .3]; % mean, stdev
samp = 10;
numBranches = 2;
bblist = [];
bblistNew =[];
% for i = 1:maxBranch
firstStruc(maxGen) = struct('curve',[]);
% end
[BezStructure,generationOut,outAR] = TreeGen(start,1,maxGen,distAng,distAngVar,distLoc,...
    distLocVar,aspectRatio, CPorder,samp,numBranches,firstStruc,bblist,bblistNew,...
    reductionFactor);

h = renderTree(BezStructure);
