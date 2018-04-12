% Main script wrapper for TreeGen
clear; clc; close all;

global bbList;
global BezStructure;
start = [0;0;0];
maxBranch = 4;
CPorder = 4;
% 
aspectRatio = [3;4;1];
dist = 0;
samp = 100;
numBranches = 3;
for i = 1:maxBranch
    BezStructure(i) = struct('curve',[]);
end
TreeGen(start,1,maxBranch,dist,aspectRatio,CPorder,samp,numBranches);
% TreeGen(start,generationIn,maxGeneration,...
%     dist,aspectRatio,CPorder,inStructure,samples)