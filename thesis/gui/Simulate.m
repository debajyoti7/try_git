function [ vertexList, colorList ] = Simulate( colorList, edgeList, simNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(colorList);
xPos = randi((N*10),[N,1]);
yPos = randi((N*10),[N,1]);
vertexList = [xPos, yPos, colorList];

beliefList = randi(5,[N,1]);

for j = 1:5
    colorList(edgeList(j,3)) = 5;
    colorList(edgeList(j,2)) = 5;
end

pause on
[n,xout] = hist(colorList);

h = bar(xout,n);
pause(3)
set(h,'XDataSource','xout','YDataSource','n');
for i = 1: simNum
    pick = randi(length(edgeList),1);
    
    %{
    if i == agentJ
        pick = agentJ;
    end
   %}
    dist = abs(beliefList(edgeList(pick,3)) - beliefList(edgeList(pick,2)));
    if (dist < 0.25)
        colorList(edgeList(pick,3)) = colorList(edgeList(pick,2));
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