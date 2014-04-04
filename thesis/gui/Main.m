function [ edgeList, degreeList, vertexList, colorList, fnc, weight, in, out] = Main( numAgents, averageConnections, mode, simNum, view )
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
if mode == 1

    %create the whole world
    [s, t, degreeList, in, out] = CreateWorld(numAgents, averageConnections, s, t, seedDegree);
    weight = ones(numAgents,1);
end

%mode 2, modified based on 'likemindedness' parameter or 'knowledgelist'
if mode == 2
    [s, t, degreeList, weight, in, out] = CreateWorldMod(numAgents, averageConnections, s, t, seedDegree);
end

edgeId = (1:length(s))';
edgeList = [edgeId, s, t];

if view == 1
    [bioGraph, handle] = PlotWorld(numAgents, edgeList);
end

%colorList = ones(averageConnections+1, 1);
%colorList = [colorList; zeros((numAgents-(averageConnections+1)),1)];
colorList = randi(50,[numAgents, 1]);

[vertexList, colorList, fnc] = Simulate(colorList, edgeList, simNum);
    
%return
end

