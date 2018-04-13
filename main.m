% Main script wrapper for TreeGen
clear; clc; close all;

start = [0;0;0];
maxGen = 4;
CPorder = 4;
% 
aspectRatio = [2;3;4];
distAng = 'Normal';
distAngVar = [0, .25]; % mean, stdev
distLoc = 'Normal';
distLocVar = [.7, .1]; % mean, stdev
samp = 100;
numBranches = 5;
bblist = [];
bblistNew =[];
% for i = 1:maxBranch
firstStruc(maxGen) = struct('curve',[]);
% end
[BezStructure,generationOut] = TreeGen(start,1,maxGen,distAng,distAngVar,distLoc,...
    distLocVar,aspectRatio, CPorder,samp,numBranches,firstStruc,bblist,bblistNew);

