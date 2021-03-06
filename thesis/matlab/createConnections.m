function [ weak, strong, listConnections, s ] = createConnections( s, Num_Agents )
%createConnections Create connections between the different agent nodes
%   Randomly assign unique, bi-directional connectins between nodes
weak = Connections.empty(Num_Agents,0);
strong = Connections.empty(Num_Agents,0);
listConnections = Connections.empty(Num_Agents,0);
index = 1;
weakIndex = 1;
strongIndex = 1;
for i = 1 : (Num_Agents-1)
    for j = 1 : Num_Agents
        if(i == j)
            continue
        end
        a = sqrt(power((s(i).Belief1 - s(j).Belief1),2) + power((s(i).Belief2 - s(j).Belief2),2));
        listConnections(index) = Connections(i,j,a);

        %TO DO : move to someplace else
        if a <= 25 %Strong signal , 0.25 means over 0.75 strength because distance is inversely related
            strong(strongIndex) = Connections(i,j,a);
            strongIndex = strongIndex + 1;
            s(i) = s(i).makeConnection();
            s(j) = s(j).makeConnection();
        else
            weak(weakIndex) = Connections(i,j,a); 
            weakIndex = weakIndex + 1;
        end
        
        index = index + 1;
    end
end

end

