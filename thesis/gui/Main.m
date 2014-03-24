function [ finalWorld, degreeList, s, t] = Main( numAgents, averageConnections )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[s, t] = Seed(averageConnections);
seedDegree = ComputeSeedDegree(s, t, averageConnections);
[s, t, degreeList] = CreateWorld(numAgents, averageConnections, s, t, seedDegree);
finalWorld = [s, t];
end

