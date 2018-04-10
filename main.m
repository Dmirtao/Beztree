% Main script wrapper for TreeGen
clear; clc; close all;

global bbList;
global BezStructure;
start = [0;0;0];
maxBranch = 2;
CPorder = 4;
% 
aspectRatio = [3;4;1];
dist = 0;
samp = 100;
numBranches = 3;
BezStructure(1:maxBranch) = struct('curve',[]);
TreeGen(start,1,maxBranch,dist,aspectRatio,CPorder,BezStructure,samp,numBranches);
% TreeGen(start,generationIn,maxGeneration,...
%     dist,aspectRatio,CPorder,inStructure,samples)