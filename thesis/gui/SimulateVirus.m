function [ vertexList, colorList, fnc ] = SimulateVirus( colorList, degreeList, edgeList, simNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(colorList);
xPos = randi((N*10),[N,1]);
yPos = randi((N*10),[N,1]);
vertexList = [xPos, yPos, colorList]; %vertexList(k,1) gives x position, vertexList(k,2) gives y position and vertexList(k,3) gives color membership for k-th agent

beliefList = randi(5,[N,1]);

%find the top two most-connected agents
c1Val = max(degreeList);
c1 = find(degreeList == c1Val, 1);
degreeList(c1) = 0;
c2 = find(degreeList == max(degreeList), 1);
degreeList(c1) = c1Val;

%initialize cluster centers
x1 = 0; %vertexList(c1,1); 
y1 = N; %vertexList(c1,2);

x50 = N; %vertexList(c2,1);
y50 = 0; %vertexList(c2,2);

%initialize starting point for tracking
time = 1;
value1 = 1;
value2 = 1;

%seed the colors in the network
colorList(10:100) = 1;
colorList(120:150) = 50;

colorList(c1) = 1;
colorList(c2) = 50;

value1count = length(find(colorList == 1));
value2count = length(find(colorList == 50));

fnc = [time, value1count, value2count];

pause on
[n,xout] = hist(colorList);

h = bar(xout,n);
pause(3)
set(h,'XDataSource','xout','YDataSource','n');
for i = 1: simNum
    pick = randi(length(edgeList),1);  % edgeList(pick) serves as edge ID, 
    % edgeList(pick,2) and edgeList(pick,3) returns agentId on both ends of
    % the edge
    
    influencingAgent = edgeList(pick,2);
    influencedAgent = edgeList(pick,3);
    
    if (colorList(influencingAgent) == value1)
        x = x1;
        y = y1;
    else 
        if ((colorList(influencingAgent)) == value2)
            x = x50;
            y = y50;
        end
    end
    
    dist = abs(beliefList(edgeList(pick,3)) - beliefList(edgeList(pick,2)));
    if ((colorList(influencingAgent) == value1) || (colorList(influencingAgent) == value2))
        %if (dist > 2)
            colorList(influencedAgent) = colorList(influencingAgent);
            
            shiftFactorA = 1;
            shiftFactorB = 10;
            
            %shift x and y coordinates of influenced agent
            vertexList(influencedAgent, 1) = vertexList(influencedAgent, 1) + ((x - vertexList(influencedAgent, 1)) /shiftFactorA);
            vertexList(influencedAgent, 2) = vertexList(influencedAgent, 2) + ((y - vertexList(influencedAgent, 2)) /shiftFactorA);
            
            %shift x and y coordinates of influencing agent , like a
            %re-inforcement
            vertexList(influencingAgent, 1) = vertexList(influencingAgent, 1) + ((x - vertexList(influencingAgent, 1)) /shiftFactorB);
            vertexList(influencingAgent, 2) = vertexList(influencingAgent, 2) + ((y - vertexList(influencingAgent, 2)) /shiftFactorB);
            
            %TO DO : add cost function
            
            time = i;
            value1count = length(find(colorList == 1));
            value2count = length(find(colorList == 50));
            
            fnc = [fnc; [time, value1count, value2count]];

            
            if(i == 500)
                value2 = 50;
            end
            
        %end
    end

    %count = 1;
    if mod(i,100)==0
        %figure;
        [n,xout] = hist(colorList);
        %hold all
        refreshdata(h,'caller')
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