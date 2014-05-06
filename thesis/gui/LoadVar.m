function [ g1,g2,c1,c2 ] = LoadVar( name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cd('D:\try_git\thesis\gui\output\data');
y = load(name,'fnc');
v = y.fnc();

%generate spread-cost function
% f = sperad - (cost/2), considering cost/2 is earned back in revenues
g1 = v(:,4);
c1 = v(:,6);
g2 = v(:,5);
c2 = v(:,7);
end
