classdef Agent
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
            obj.AgentId = id;
            obj.EnterpriseId = eId;
            obj.Belief1 = b1;
            obj.Belief2 = b2;
            obj.NumOfConnections = 0;
        end
    end
    
end

