function [ vertexList, colorList, fnc ] = Simulate( colorList, edgeList, simNum )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(colorList);
xPos = randi((N*10),[N,1]);
yPos = randi((N*10),[N,1]);
vertexList = [xPos, yPos, colorList];

beliefList = randi(5,[N,1]);

clr = randi(50,1); % randomly selected color to track
step = 0;
value = length(find(colorList == clr));
fnc = [step, value];

pause on
[n,xout] = hist(colorList);

h = bar(xout,n);
pause(3)
set(h,'XDataSource','xout','YDataSource','n');
for i = 1: simNum
    pick = randi(length(edgeList),1);
    
    dist = abs(beliefList(edgeList(pick,3)) - beliefList(edgeList(pick,2)));
    if (colorList(edgeList(pick,2)) == clr)
        %if (dist > 2)
            colorList(edgeList(pick,3)) = colorList(edgeList(pick,2));
            step = i;
            value = length(find(colorList == clr));
            fnc = [fnc;[step, value]]; % track every increment/spread with respect to time step
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