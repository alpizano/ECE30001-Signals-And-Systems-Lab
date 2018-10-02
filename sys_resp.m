function [y] = sys_resp(x)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
G = 2;
b = 0.5;

y = G.*x+b;
end

