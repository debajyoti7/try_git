function [f1, f2] = LoadFnc( name )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
cd('D:\try_git\thesis\gui\output\data');
y = load(name,'fnc');
v = y.fnc();

%generate spread-cost function
% f = sperad - (cost/2), considering cost/2 is earned back in revenues
f1 = v(:,4) - (v(:,6)/2);
f2 = v(:,5) - (v(:,7)/2);
end

