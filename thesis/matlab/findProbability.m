function [ probabilityBA , probabilityMod ] = findProbability( newAgent, agents, connections )
%findProbability This computes the probability of a connection being formed
%   This function finds the chances of a connection to be formed, for a
%   given network and an incoming node. It should keep up with the concept
%   of Preferential Attachment.

numAgents = length(agents);

for i = 1:numAgents
    j(i) = agents(i).NumOfConnections;
end

totalConnections = sum(j);
sz = size(totalConnections);
probabilityBA = zeros(sz);

for i = 1:numAgents
    probabilityBA(i) = agents(i).NumOfConnections / totalConnections;
    if probabilityBA(i) < 0
        probabilityBA(i) = 0;
    end
end

%disp(probabilityBA); %display BA-probability

%Modify probability based on belief values  - Extra work on top of B-A
%model
%TO DO : move to separate script, or reduce redundant looping. Preferably
%move to new script.

probabilityMod = zeros(sz);
for i = 1:numAgents
    distance = sqrt(power((agents(i).Belief1 - newAgent.Belief1),2) + power((agents(i).Belief2 - newAgent.Belief2),2));
    probabilityMod(i) = (probabilityBA(i) + (1-distance)) / 2; %self-loop goes to 0.5
    if(probabilityMod(i) < 0)
        probabilityMod(i) = 0;
end

end

