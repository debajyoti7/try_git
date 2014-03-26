function [ s, t, degree, weight ] = CreateWorldMod( N, d, s, t, degree )
%CreateWorldMod This creates the world using modifiers
%   Detailed explanation goes here

likeMindedness = rand(N,1);

for i=d+2:N
    prob=degree/sum(degree); %change here to account for belief values
    weight = zeros(length(prob),1);    

    for j = 1:length(weight)
        weight(j) = abs(likeMindedness(i)-likeMindedness(j));
    end
    
    %extra part for modification
    prob = prob + weight;
    
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