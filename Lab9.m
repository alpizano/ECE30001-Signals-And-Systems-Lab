% Alberto Pizano
% ECE301 
% Lab 9
clc;
clear;

dt = 1/10000;
t = 0:dt:1/60;
w = 240*pi; % 2PI/T and T = 1/120 s
A = 1;

xt = 0; % full wave rectified input signal
yt = 0; %peak to peak

e = exp(1);


for k = -2:3
    

    xt = xt + (-2*A/(pi*(4*k.^2-1))*e.^(j*k*w*t));