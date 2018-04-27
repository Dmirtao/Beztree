% Main script wrapper for TreeGen. Execute this script in the MATLAB
% environment to create and render the tree structure.
clear; clc; close all;
rng('shuffle');

% Start of 1st generation's curve
start = [0;0;0];

% Maximum number of branch generations to create
maxGen = 4;

% Order of the generated Bezier curves
CPorder = 11;

% Aspect ratio of the Bezier curve bounding prisms in [x;y;z]
aspectRatio = [1;1;4];

% Ratio of how much the aspect ratio is decimated each generation.
reductionFactor = 0.7;

% Type of probability distribution to use for branching angle choosing
distAng = 'Normal';

% Parameters of the probability distribution for branching angles
distAngVar = [0, 0.3]; % [mean, stdev]

% Type of probability distribution to use for branching location on the
% parent
distLoc = 'Normal';

% Parameters of the probability distribution for branching locations
distLocVar = [.8, .3]; % [mean, stdev]

% Points to sample per Bezier curve 
samp = 10;

% Number of branches from parent for eaech generation.
numBranches = 4;

% Inistialize storage structures.
bblist = [];
bblistNew =[];
firstStruc(maxGen) = struct('curve',[]);

% Initialize the primary recurvsive structure generation
[BezStructure,generationOut,outAR] = TreeGen(start,1,maxGen,distAng,distAngVar,distLoc,...
    distLocVar,aspectRatio, CPorder,samp,numBranches,firstStruc,bblist,bblistNew,...
    reductionFactor);

% Render the tree structure.
h = renderTree(BezStructure);
view(0,30)