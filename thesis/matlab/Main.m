function [s, c, weak, strong] = Main( Num_Agents )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s = createAgents(Num_Agents);
[weak, strong, c] = createConnections(s , Num_Agents);
end