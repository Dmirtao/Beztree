% Main script wrapper for TreeGen
clear; clc; close all;

start = [0;0;0];
maxGen = 4;
CPorder = 5;
rng('shuffle');

% 
aspectRatio = [1;2;8];
reductionFactor = 0.5;  % Ratio of how much the aspect ratio is decimated each generation.
distAng = 'Normal';
distAngVar = [0, 0.2]; % mean, stdev
distLoc = 'Normal';
distLocVar = [.7, .3]; % mean, stdev
samp = 100;
numBranches = 5;
bblist = [];
bblistNew =[];
% for i = 1:maxBranch
firstStruc(maxGen) = struct('curve',[]);
% end
[BezStructure,generationOut,outAR] = TreeGen(start,1,maxGen,distAng,distAngVar,distLoc,...
    distLocVar,aspectRatio, CPorder,samp,numBranches,firstStruc,bblist,bblistNew,...
    reductionFactor);

h = renderTree(BezStructure);
