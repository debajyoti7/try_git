function [ agents, connections, weak, strong ] = addConnection( agents, connections, weak, strong, probability, Num_SeedAgents )
%addConnection add a new connection for an incoming agent node
%   Create connections for an agent node based on the probability value

strongCounter = length(strong);
weakCounter = length(weak);
counter = length(connections);
last = length(agents);

%TO DO = move makeConnect to separate (level)  script, so both
%addConnection and create connection can make use of it.
flag = 0;
limit = Num_SeedAgents/2; %randsample(counter,1);
for i = 1 : (length(agents) -1)
    if rand() > probability(i) % >= mean(probability) %using mean instead of random
        strongCounter = strongCounter+1;
        strong(strongCounter) = Connections( agents(i) , agents(last), probability(i));
        agents(i) = agents(i).makeConnection();
        agents(last) = agents(last).makeConnection();
        flag = flag + 1;
        if probability(i) < mean(probability)
            flag = flag -1;
        end
    else
        weakCounter = weakCounter + 1;
        weak(weakCounter) = Connections( agents(i) , agents(last), probability(i));
    end
    counter = counter + 1;
    connections(counter) = Connections( agents(i) , agents(last), probability(i));
    if flag == limit
        break;
    end
end