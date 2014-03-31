function [ edgeList, degreeList, vertexList, weight] = Main( numAgents, averageConnections, mode )
%Main Generates and simulates a scale free network.
%   This follows the approach presented by BA-algorithm to create a
%   fully-connected seed network and introduce new nodes to it (Continuous
%   Growth) in a manner that the incoming nodes tend to connect to higest
%   connected nodes (Preferential Attachment).

%create seed network
[s, t] = Seed(averageConnections);


%calculate degree of connection in seed network
seedDegree = ComputeSeedDegree(s, t, averageConnections);
 
% mode 1, B-A model
if mode==1

    %create the whole world
    [s, t, degreeList] = CreateWorld(numAgents, averageConnections, s, t, seedDegree);
    weight = ones(numAgents,1);
end

%mode 2, modified based on 'likemindedness' parameter or 'knowledgelist'
if mode == 2
    [s, t, degreeList, weight] = CreateWorldMod(numAgents, averageConnections, s, t, seedDegree);
end

edgeList = [s, t];

vertexList = Simulate(numAgents);
%return
end

