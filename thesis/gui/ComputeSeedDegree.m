function [ seedDegree ] = ComputeSeedDegree( s, t, d )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

f=accumarray(s,ones(length(s),1));
if length(f)<d+1
    for mm=1:(d+1-length(f))
        f(length(f)+1)=0;
    end
end

g=accumarray(t,ones(length(t),1));
if length(g)<d+1
    for mm=1:(d+1-length(g))
        g(length(g)+1)=0;
    end
end
seedDegree=f+g;

end

