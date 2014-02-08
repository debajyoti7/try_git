function [s, c, weak, strong] = Seed( Num_Agents )
%SEED creates a seed network with specified number of nodes
%   This creates a static network with a given number of Agent nodes, and
%   connects them to each other. It generates n * n! connections for
%   n-nodes.

s = createAgents(Num_Agents);
[weak, strong, c, s] = createConnections(s , Num_Agents);
end