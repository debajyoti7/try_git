function [ probability ] = findProbability( newAgent, agents, connections )
%findProbability This computes the probability of a connection being formed
%   This function finds the chances of a connection to be formed, for a
%   given network and an incoming node. It should keep up with the concept
%   of Preferential Attachment.

numAgents = length(agents);

for i = 1:numAgents
    j(i) = agents(i).NumOfConnections;
end

totalConnections = sum(j);

for i = 1:numAgents
    probability(i) = agents(i).NumOfConnections / totalConnections;
end

%Modify probability based on belief values  - Extra work on top of B-A
%model
%TO DO : move to separate script, or reduce redundant looping. Preferably
%move to new script.

for i = 1:numAgents
    distance = sqrt(power((agents(i).Belief1 - newAgent.Belief1),2) + power((agents(i).Belief2 - newAgent.Belief2),2));
    probability(i) = probability(i) + distance;
end

end

