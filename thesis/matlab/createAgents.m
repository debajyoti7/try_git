function [ a ] = createAgents( Num_Agents )
%createAgents creates the agent nodes
%   This module creates and instantiates instances of the agent nodes
for i = 1:Num_Agents
    Ent_Id = randi(4,1,1);
    b1 = rand();
    b2 = rand();
    a(i) = Agent(i,Ent_Id,b1,b2);
end
end

