% Main script wrapper for TreeGen
clear; clc; close all;

global bbList;
BezStructure = struct([]);
start = [0;0;0];
maxBranch = 3;
CPorder = 4;
% 
aspectRatio = [3;4;1];

TreeGen(start,maxBranch,dist,aspectRatio,CPorder,BezStructure);