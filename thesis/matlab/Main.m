function [s, c, weak, strong, probabilityBA, probabilityMod] = Main( Num_SeedAgents, Num_TotalAgents )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

[s, c, weak, strong] = Seed(Num_SeedAgents);

k = length(s);
for i = Num_SeedAgents+1 : Num_TotalAgents
    Ent_Id = randi(4,1,1);
    b1 = rand();
    b2 = rand();
    s(i) = addAgent(i , Ent_Id, b1, b2);
    [probabilityBA , probabilityMod] = findProbability(s(i), s, c);
    [s, c, weak, strong] = addConnection(s,c, weak, strong, probabilityMod);
end
end