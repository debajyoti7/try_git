function [ newAgent ] = AddAgent( id, eId, b1, b2 )
%AddAgent Dynamically add an agent
%   Dynamically add a new agent, and simulate the attribute of Continuous
%   Growth in the model.

c = 0; %by default, a new agent has zero connections
newAgent = Agent(id,eId, b1, b2, c);
end

