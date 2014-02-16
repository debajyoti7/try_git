function [ agents, connections, weak, strong ] = addConnection( agents, connections, weak, strong, probability )
%addConnection add a new connection for an incoming agent node
%   Create connections for an agent node based on the probability value

strongCounter = length(strong);
last = length(agents);

%TO DO = move makeConnect to separate (level)  script, so both
%addConnection and create connection can make use of it.
for i = 1 : (length(agents) -1)
    if probability(i) >= 0.50
        strongCounter = strongCounter+1;
        strong(strongCounter) = Connections( agents(i) , agents(last), probability(i));
        agents(i) = agents(i).makeConnection();
        agents(last) = agents(last).makeConnection();
    end
end