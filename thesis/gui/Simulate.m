function [ vertexList, colorList ] = Simulate( colorList, edgeList )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

N = length(colorList);
xPos = randi((N*10),[N,1]);
yPos = randi((N*10),[N,1]);

vertexList = [xPos, yPos, colorList];
for in = 1:length(edgeList)/5
    pick = randi(length(edgeList),1);
    colorList(edgeList(pick,3)) = colorList(edgeList(pick,2));
end

end