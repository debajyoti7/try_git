function [ handle ] = plotRelation( Num_Agents, agents )
%plotRelation This function pots the number of connections
%   The plot is for the number of connections against the frequency of that
%   number from a connection view.

for i = 1 : Num_Agents
    Num_Connections(i) = agents(i).NumOfConnections;
end

for i = 1 : Num_Agents
    handle(i) = sum(Num_Connections == i);
end
bar(handle,'DisplayName','h');figure(gcf)
end