function [ vertexList, colorList, fnc ] = SimulateVirus( colorList, degreeList, edgeList, simNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(colorList);
xPos = randi((N),[N,1]);
yPos = randi((N),[N,1]);

beliefList = randi(5,[N,1]);
for a = 1 : length(beliefList)
    %assign belief value as a function of number of connections of the agent  
    beliefList(a) = ( length(find(edgeList(:,2) == a)) + length(find(edgeList(:,3) == a)) ) / max(degreeList);
end

%vertexList(k,1) gives x position, vertexList(k,2) gives y position and
%vertexList(k,3) gives color membership for k-th agent
vertexList = [xPos, yPos, colorList, beliefList]; 


%find the top two most-connected agents
c1Val = max(degreeList);
c1 = find(degreeList == c1Val, 1);
degreeList(c1) = 0;
c2 = find(degreeList == max(degreeList), 1);
degreeList(c1) = c1Val;

%initialize cluster centers
x1 = N/4; %vertexList(c1,1); 
y1 = N/2; %vertexList(c1,2);

x50 = N*(3/4); %vertexList(c2,1);
y50 = N/2; %vertexList(c2,2);

%initialize starting point for tracking
time = 1;
value1 = 1;
value2 = 50;

%seed the colors in the network
%use randperm instead of strong initial color seeding

index = randperm(N);
v1index = index(1 : N/5);
v2index = index( ((N/5)+1) : N*(2/5));
v3index = index( (N*(2/5) +1) : (N*(3/5)) );
v4index = index( (N*(3/5) +1) : (N*(4/5)) );


for lv = 1 : length(v1index)
    colorList(v1index) = 1;
    colorList(v2index) = 50;
    colorList(v3index) = 25;
    colorList(v4index) = 25;
end

%{
colorList(10:110) = 50;
colorList(120:220) = 1;
colorList(240:500) = 25;
%}

colorList(c1) = 1;
colorList(c2) = 50;

value1count = length(find(colorList == value1));
value2count = length(find(colorList == 50));
spread1count = 0;
spread2count = 0;
cost1 = 0;
cost2 = 0;

%shiftI1 is for influenced agent, and shift I2 is for influencing agent and
%company itself, for compnay I
shift11 = 5;
shift12 = 10;
shift21 = shift11;
shift22 = shift12;

fnc = [time, value1count, value2count, spread1count, spread2count, cost1, cost2];

pause on

%{
[n,xout] = hist(colorList);
h = bar(xout,n);
pause(3)
set(h,'XDataSource','xout','YDataSource','n');
%}

figure;
s = 10;
c = linspace(1,10,length(vertexList(:,1)));
h2 = scatter(vertexList(:,1),vertexList(:,2),[],colorList);
set(h2,'XDataSource','vertexList(:,1)', 'YDataSource','vertexList(:,2)');

for i = 1: simNum
    pick = randi(length(edgeList),1);  % edgeList(pick) serves as edge ID, 
    % edgeList(pick,2) and edgeList(pick,3) returns agentId on both ends of
    % the edge
    
    influencingAgent = edgeList(pick,2);
    influencedAgent = edgeList(pick,3);
    
    if (colorList(influencingAgent) == value1)
        x = x1;
        y = y1;
        shiftFactorA = shift11;
        shiftFactorB = shift12;
    else 
        if ((colorList(influencingAgent)) == value2)
            x = x50;
            y = y50;
            shiftFactorA = shift21;
            shiftFactorB = shift22;
        end
    end
    
    %dist = abs(beliefList(edgeList(pick,3)) - beliefList(edgeList(pick,2)));
    dist = beliefList(influencingAgent);
    if ((colorList(influencingAgent) == value1) || (colorList(influencingAgent) == value2))
        thresh = rand(1);
        if (dist >= thresh)
            
            %experimental change ,  TO DO : change initial spread to
            %ternary distribution
            colorList(influencedAgent) = colorList(influencedAgent) + ceil((colorList(influencingAgent) - colorList(influencedAgent))/shiftFactorA);
            
            
            
            %shift x and y coordinates of influenced agent
            vertexList(influencedAgent, 1) = vertexList(influencedAgent, 1) + ceil((x - vertexList(influencedAgent, 1)) /shiftFactorA);
            vertexList(influencedAgent, 2) = vertexList(influencedAgent, 2) + ceil((y - vertexList(influencedAgent, 2)) /shiftFactorA);
            
            %shift x and y coordinates of influencing agent , like a
            %re-inforcement
            vertexList(influencingAgent, 1) = vertexList(influencingAgent, 1) + ceil((x - vertexList(influencingAgent, 1)) /shiftFactorB);
            vertexList(influencingAgent, 2) = vertexList(influencingAgent, 2) + ceil((y - vertexList(influencingAgent, 2)) /shiftFactorB);
            
            %TO DO : add cost function, shift company clusters
            x = x + ceil(x - vertexList(influencedAgent, 1) / shiftFactorB);
            y = y + ceil(y - vertexList(influencedAgent, 2) / shiftFactorB);
            
            time = i;
            
            if (colorList(influencingAgent) == value1)
                spread1count = spread1count + 1;
                cost1 = cost1 + (1/shiftFactorB);
                if( mod(cost1, 2)  == 0)
                    shift12 = shift12/2; %not affecting shift11 and shift21 for now
                end
            else
                spread2count = spread2count + 1;
                cost2 = cost2 + (1/shiftFactorB);
                if( mod(cost2, 2) == 0)
                    shift22 = shift22/2;
                end
            end
            
            value1count = length(find(colorList == value1));
            value2count = length(find(colorList == 50)); 
            
            fnc = [fnc; [time, value1count, value2count, spread1count, spread2count, cost1, cost2]];

            %{
            if(i == 500)
                value2 = 50;
            end
            %}
        end
    end

    %count = 1;
    if mod(i,100)==0
        %figure;
        %[n,xout] = hist(colorList);
        %refreshdata(h,'caller')
        refreshdata(h2, 'caller')
        drawnow
        %pause(1)
        %hold all
        %axis equal
        %M(count) = getframe;
        %count = count +1;
    end

end
pause off
%movie2avi(M, 'April2.avi', 'compression','None');
end