function [ finalWorld, degreeList, s, t] = Main( numAgents, averageConnections )
%Main Generates and simulates a scale free network.
%   This follows the approach presented by BA-algorithm to create a
%   fully-connected seed network and introduce new nodes to it (Continuous
%   Growth) in a manner that the incoming nodes tend to connect to higest
%   connected nodes (Preferential Attachment).

%create seed network
[s, t] = Seed(averageConnections);

%calculate degree of connection in seed network
seedDegree = ComputeSeedDegree(s, t, averageConnections);

%create the whole world
[s, t, degreeList] = CreateWorld(numAgents, averageConnections, s, t, seedDegree);
finalWorld = [s, t];

%return
end

