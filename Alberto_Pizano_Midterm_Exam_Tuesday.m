% ALBERTO PIZANO
% ECE301 MIDTERM TUESDAY 10/16/2018


clc
clear

%PROBLEM #1 A) g as a function of time "t"
load Prob1Tuesday

g = 1:length(t);

figure;
%subplot(2,1,1)
plot(t,g)
title('uniformly sampled g')
xlabel('t in seconds')
ylabel('g(t)')
axis([-5 8 -10 80])

%PROBLEM #1 B) Time reverse function g(t) is g(-t)
g_rev = -g;

figure;
%subplot(2,1,2)
plot(-t,g)
title('TIME REVERSED uniformly sampled g')
xlabel('t in seconds')
ylabel('g(t)')
axis([-5 8 -10 80])

%PROBLEM #1 C) Determining if signal g is even or odd

g_even = (1/2)*(g + g_rev);
g_odd = (1/2)*(g - g_rev);

% Summing both signals should yield the original function g(t)
g_new = g_even + g_odd;

figure;
plot(t,g_even)
title('g even plot')
xlabel('t in seconds')
ylabel('g(t)')

figure;
plot(t,g_odd)
title('g odd plot')
xlabel('t in seconds')
ylabel('g(t)')

figure;
plot(t,g_new)
title('g odd + g even')
xlabel('t in seconds')
ylabel('g(t)')


% PROBLEM #2

dt = 0.01;
t2 = -5:dt:8;

x = 3*(t2+2).*heaviside(t2+2) - 3*(t2+1).*heaviside(t2+1) - 3*heaviside(t2-1) -heaviside(t2-1) + heaviside(t2-3);

figure;
plot(t2,x)
title('analytic waveform problem #2')
xlabel('t in seconds')
ylabel('x(t)')
axis([-5 8 -2 4])