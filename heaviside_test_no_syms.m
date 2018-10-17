clc
clear

t = -5:0.01:8;

x =  3*(t+2).*heaviside(t+2)-3*(t+1).*heaviside(t+1)-4*heaviside(t-1)+heaviside(t-3);

plot(t,x)
