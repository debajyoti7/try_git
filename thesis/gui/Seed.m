function [ s, t ] = Seed( d )
%Seed Creates a fully-connected seed network.
%   It generates d+1 nodes and creates a fully connected network. d+1 nodes
%   are used to maintain average of d connections.

%generate fully connected network
s=floor((d+1:d+d*(d+1))/(d+1))';
t=(mod(d+1:d+d*(d+1),d+1)+1)';
LoopIndex=find(s==t);
s(LoopIndex)=[];
t(LoopIndex)=[];

%remove duplicate values
[~, a]=unique(sort([s t],2),'rows'); %changed C to ~
RepeatIndex=setdiff(1:length(s),a);
s(RepeatIndex)=[];
t(RepeatIndex)=[];

%return seed network, s is a list of starting nodes for edges, while t is
%the list of ending nodes for the edges, making [s, t] the edge list for
%the network.
end

