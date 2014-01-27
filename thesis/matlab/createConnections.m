function [ listConnections ] = createConnections( Num_Agents )
%createConnections Create connections between the different agent nodes
%   Randomly assign unique, bi-directional connectins betwwen nodes
s = createAgents(Num_Agents);
index = 1;
for i = 1 : (Num_Agents-1)
    for j = (i+1) : Num_Agents
        a = randi(2,1,1);
        if a == 1
            listConnections(index) = Connections(i,j);
            index = index + 1;
        end
    end
end

end

