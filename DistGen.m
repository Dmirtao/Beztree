function [Dist] = DistGen(type, varargin)
%DistGen 
% A function that defines probability distributions with user
% defined distribution type(Normal, Exponential, Lognormal, or Beta Distribution) and needed
% inputs for those given distribution in their respective order
%...
%INPUTS:
%   type     -- string of the type of distribution wanted. For list of type
%   "makedist" into Command Prompt and hit F1.
%
%   varagin  -- add all the imputs needed for each type of distribution 
%   as needed. (see documentation of makedist for more information on
%   inputs needed)
%
%OUTPUTS:
%   Dist    -- The distribution with the shape if the input type and input
%   weights. random(DistGen(type, weight1, weight2) will output a randoim
%   number based of the specified distribution.

    %Check for inputs based on number of distribution inputs
    l = length(varargin);
    if l == 0
        disp('ERROR: Need inputs for this tpye of distribution.')
        disp('*see documentation on makedist for more information about needed inputs*')
        return
    elseif l > 2
        disp('ERROR: Too many inputs for this distribution type, an input will not be used.')
        disp('*see documentation on makedist for more information about needed inputs*')
        return
    end
    
    t = linspace(0, 1, 200); %the number of points that make up probability distribution
    
    %Each distribution type requires different inputs, so identify which
    %distribution type the user wants.
    
    %--- Normal ---
    if strcmp(type, 'Normal') == 1 
        %Check for inputs based on number of distribution inputs
        if l < 2
            disp('ERROR: Need more inputs for this tpye of distribution.')
            disp('*see documentation on makedist for more information about needed inputs*')
            return
        end
        
        weight1 = varargin{1};
        weight2 = varargin{2};
        if weight1 > 1 || weight1 < 0
            disp('ERROR: Mean must be within 0 and 1')
            return
        elseif weight2 < 0.01 || weight2 > 10 
            disp('ERROR: Stdev must be reasonable')
            return
        end
            
        Dist = makedist(type, weight1, weight2);
%         p = cumsum(pdf(Dist, t)/length(t));
%         plot(t, p);
        
    %--- Exponential ---
    elseif strcmp(type, 'Exponential') == 1
        %Check for inputs based on number of distribution inputs        
        weight1 = varargin{1};      
        if weight1 > 1 || weight1 < 0
            disp('ERROR: Mean must be within 0 and 1')
            return
        end
        
        Dist = makedist(type, weight1);
%         p = cumsum(pdf(Dist, t)/length(t));
%         plot(t, p);
        
    %--- Lognormal ---
    elseif strcmp(type, 'Lognormal') == 1
        %Check for inputs based on number of distribution inputs
        if l < 2
            disp('ERROR: Need more inputs for this tpye of distribution.')
            disp('*see documentation on makedist for more information about needed inputs*')
            return
        end
        
        weight1 = varargin{1};
        weight2 = varargin{2};        
        if weight1 > 1 || weight1 < 0
            disp('ERROR: Mean must be within 0 and 1')
            return
        elseif weight2 < 0.01 || weight2 > 10 
            disp('ERROR: Stdev must be reasonable')
            return
        end
            
        Dist = makedist(type, weight1, weight2);
%         p = cumsum(pdf(Dist, t)/length(t));
%         plot(t, p);
        
    %--- Beta ---        
    elseif strcmp(type, 'Beta') == 1
        %Check for inputs based on number of distribution inputs
        if l < 2
            disp('ERROR: Need more inputs for this tpye of distribution.')
            disp('*see documentation on makedist for more information about needed inputs*')
            return
        end
        
        weight1 = varargin{1};
        weight2 = varargin{2};        
        if weight1 <= 0
            disp('ERROR: shape parameter must be a positive integer')
            return
        elseif weight2 <=0 
            disp('ERROR: scale parameter must be a positive integer')
            return
        end
        
        Dist = makedist('Beta','a',weight1,'b',weight2);
%         p = cumsum(pdf(Dist, t)/length(t));
%         plot(t, p);            
    end

end

