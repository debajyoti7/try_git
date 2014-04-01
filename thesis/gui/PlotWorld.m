function [ bg, h ] = PlotWorld( numAgents, edgeList )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
DG = sparse(edgeList(:,2),edgeList(:,3),1,numAgents,numAgents);
bg = biograph(DG,[],'ShowWeights','off');
h = view(bg);

end

