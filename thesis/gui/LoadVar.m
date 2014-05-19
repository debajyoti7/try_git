function [ g1,g2,c1,c2,f1,f2 ] = LoadVar( name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cd('D:\try_git\thesis\gui\output\data\base2');
y = load(name,'fnc');
v = y.fnc();

%generate spread-cost function
% f = sperad - (cost/2), considering cost/2 is earned back in revenues
g1 = v(:,4);
c1 = v(:,6);
g2 = v(:,5);
c2 = v(:,7);
f1 = g1 - c1;
f2 = g2 - c2;
cd('D:\try_git\thesis\gui\output\data\fig2');
fname = strcat('f2 - f1_',name,'.png');
h2 = plot(f2-f1,'DisplayName','f2 - f1');
h2leg1 = legend('f2 - f1');
saveas(h2,fname);



end
