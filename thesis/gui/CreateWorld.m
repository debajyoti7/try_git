function [ s, t, degree, f, g ] = CreateWorld( N, d, s, t, degree )
%CreateWorld This creates the world according to BA model
%   Detailed explanation goes here

for i=d+2:N
    prob=degree/sum(degree); %change here to account for belief values
    nodeProb=[(1:length(prob))' prob];
    %k = randi(d,1);
    %use k instead of d/2 in next two lines if ignoring average connectivity degree
    Connect=datasample(nodeProb(:,1),floor(d/2),'Replace',false,'Weights',prob); %make half of average connections outgoing
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

