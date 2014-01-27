classdef Agent < hgsetget
    %AGENT Class model for agent node
    %   This class models the basic attributes for an agent node
    
    properties
        AgentId %Agent Id
        EnterpriseId %Id of the enterprise that the agent is a member of
        Belief1 %Membership value for belief function 1
        Belief2 %Membership value for belief functio 2
        NumOfConnections %Number of connections the agent makes
    end
    
    methods
        function obj = Agent(id, eId, b1, b2)
            %Default, parameterised Constructor for the class Agent
            obj.AgentId = id;
            obj.EnterpriseId = eId;
            obj.Belief1 = b1;
            obj.Belief2 = b2;
            obj.NumOfConnections = 0;
        end
        
        function obj = set.NumOfConnections(obj,k)
            %Method used for changing the number of connections for a
            %specific Agent node. NOTE : if k is negative, then it
            %represents removing a connection.
            obj.NumOfConnections = obj.NumOfConnections + k;
        end
        
    end
    
end

