function [ s, t ] = Seed( d )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%generate fully connected network
s=floor((d+1:d+d*(d+1))/(d+1))';
t=(mod(d+1:d+d*(d+1),d+1)+1)';
LoopIndex=find(s==t);
s(LoopIndex)=[];
t(LoopIndex)=[];

%remove duplicate values
[C a]=unique(sort([s t],2),'rows');
RepeatIndex=setdiff(1:length(s),a);
s(RepeatIndex)=[];
t(RepeatIndex)=[];

%return seed network
end

