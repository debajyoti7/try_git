function [ output_args ] = plotRes( dirName )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

files = dir(dirName);

for i = 3 : length(files)
    LoadVar(files(i).name);
end

end