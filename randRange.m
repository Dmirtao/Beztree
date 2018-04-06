function randNum = randRange(min,max)
%randRange Generates a random number within the range min-max
%   Detailed explanation goes here
    randNum = (max-min).*rand(1,1)+min;
end

