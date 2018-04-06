function randNum = randRange(min,max)
%randRange Generates a random number within the range min-max
% INPUTS:
% min   --  Minimum of range
% max   --  Maximum of range
% OUTPUTS:
% randNum --  Random double in the range of min-max
% Version 1.0
    randNum = (max-min).*rand(1,1)+min;
end

