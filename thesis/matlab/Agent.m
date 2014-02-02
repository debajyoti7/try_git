classdef Agent < Knowledge
    %AGENT Class model for agent node
    %   This class models the basic attributes for an agent node
    
    properties
        AgentId %Agent Id
        EnterpriseId %Id of the enterprise that the agent is a member of
        NumOfConnections %Number of connections the agent makes
    end
    
    methods
        function obj = Agent(id, eId, b1, b2, c1)
            %Default, parameterised Constructor for the class Agent
            obj.AgentId = id;
            obj.EnterpriseId = eId;
            obj.knowledge1 = 2;
            obj.Belief1 = b1;
            obj.Belief2 = b2;
            obj.NumOfConnections = c1;
        end
        
        function obj = makeConnection(obj)
            %Method used to increase the connection counter by 1
            obj.NumOfConnections = obj.NumOfConnections + 1;
        end
        
        function obj = removeConnection(obj)
            %Method used to decrease the connection counter by 1
            obj.NumOfConnections = obj.NumOfConnections - 1;
        end
        
    end
    
end

