function [s, c, weak, strong, probabilityBA, probabilityMod] = Main( Num_Agents )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[s, c, weak, strong] = Seed(Num_Agents);

k = length(s);
s(k+1) = addAgent(Num_Agents+1 , 2, 0.5, 0.5);
[probabilityBA , probabilityMod] = findProbability(s(k+1), s, c);
end