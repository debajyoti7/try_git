function [ seedDegree ] = ComputeSeedDegree( s, t, d )
%ComputeSeedDegree computes the degree of connections in the seed network.
%   This computes the degree of connections for the nodes in the seed
%   network.

%outgoing connections, since s in starting point
f=accumarray(s,ones(length(s),1));
if length(f)<d+1
    for mm=1:(d+1-length(f))
        f(length(f)+1)=0;
    end
end

%incoming connections, since t is ending point
g=accumarray(t,ones(length(t),1));
if length(g)<d+1
    for mm=1:(d+1-length(g))
        g(length(g)+1)=0;
    end
end

%return
seedDegree=f+g;
end

