function [s, c, weak, strong, probabilityBA, probabilityMod] = Main( Num_SeedAgents, Num_TotalAgents )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[s, c, weak, strong] = Seed(Num_SeedAgents);

for i = Num_SeedAgents+1 : Num_TotalAgents
    Ent_Id = randi(4,1,1);
    b1 = rand();
    b2 = rand();
    s(i) = AddAgent(i , Ent_Id, b1, b2);
    [probabilityBA , probabilityMod] = findProbability(s(i), s, c);
    [s, c, weak, strong] = addConnection(s,c, weak, strong, probabilityBA, Num_SeedAgents);
end

%{
for i = 1 : Num_TotalAgents
    
end
%}
for i = 1 : 1000
    for j = 1:Num_TotalAgents
        [probabilityBA , probabilityMod] = findProbability(s(j), s, c);
    end
    [s, c, weak, strong] = addConnection(s,c, weak, strong, probabilityBA, Num_SeedAgents); 
end
end