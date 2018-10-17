clc
clear

load Prob1Monday.mat

DT = 0.1;
%L = length(g);
%LH = (L-1)/2;
%n = -LH:1:LH;
%t = n*DT;

figure;
subplot(2,1,1)
plot(t, g)
title('#1 midterm funct. g(t)')
ylabel('g(t)')
xlabel('t in seconds')
%axis([-3 3 -4 4])
grid on

g_rev = -g;
subplot(2,1,2)
plot(t,g_rev)
title('#1 midterm reversed g(t)')
ylabel('g(t) reversed')
xlabel('t in seconds')
grid on
%axis([-3 3 -4 4])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

syms x(t)
x(t) = 3*(t+2)*heaviside(t+2)-3*(t+1)*heaviside(t+1)-4*heaviside(t-1)+heaviside(t-3);
v = -5:0.01:8;
y = double(x(v));
figure;
plot(v,y);
title('Analytical form')
xlabel('t in seconds')
ylabel('x(t)')



