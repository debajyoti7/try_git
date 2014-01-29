function [ listConnections ] = createConnections( s, Num_Agents )
%createConnections Create connections between the different agent nodes
%   Randomly assign unique, bi-directional connectins betwwen nodes
index = 1;
for i = 1 : (Num_Agents-1)
    for j = (i+1) : Num_Agents
        a = sqrt(power((s(i).Belief1 - s(j).Belief1),2) + power((s(i).Belief2 - s(j).Belief2),2));
        if a <= 0.5 %Strong signal
            listConnections(index) = Connections(i,j);
            index = index + 1; 
        end
    end
end

end

