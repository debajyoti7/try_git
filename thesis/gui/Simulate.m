function [ vertexList ] = Simulate( N )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

xPos = randi((N*10),[N,1]);
yPos = randi((N*10),[N,1]);
colorList = randi(4,[N,1]);

vertexList = [xPos, yPos, colorList];
end