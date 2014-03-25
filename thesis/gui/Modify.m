function [ weight ] = Modify( agents, s, t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

%generate Knowledge or 'likemindedness'
likeMindedness = rand(agents,1);
weight = zeros(length(s),1);

for i = 1 : length(s)
    a = s(i);
    b = t(i);
    weight(i) = abs(likeMindedness(a)-likeMindedness(b));
end

end