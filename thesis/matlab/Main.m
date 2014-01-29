function [] = Main( Num_Agents )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

s = createAgents(Num_Agents);
c = createConnections(s , Num_Agents);

for i = 1 : length(c)
    a = c(i).m1;
    b = c(i).m2;
    s(a).makeConnection();
    s(b).makeConnection();
end

end

