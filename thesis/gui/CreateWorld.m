function [ s, t, degree ] = CreateWorld( N, d, s, t, degree )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

for i=d+2:N
prob=degree/sum(degree);
nodeProb=[(1:length(prob))' prob];
Connect=datasample(nodeProb(:,1),floor(d/2),'Replace',false,'Weights',prob);
s=[s;ones(floor(d/2),1)*i];
t=[t;Connect];

f=accumarray(s,ones(length(s),1));
if length(f)<i
    for mm=1:(i-length(f))
        f(length(f)+1)=0;
    end
end
g=accumarray(t,ones(length(t),1));
if length(g)<i
    for mm=1:(i-length(g))
        g(length(g)+1)=0;
    end
end

degree=f+g;
end
end

