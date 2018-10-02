clc;
clear;

%problem 2; sys_rep

G =2;
b = 0.5;

x = -2:1:10;
x1(1:length(x)) = 1.2;
x2(1:length(x)) = -1.2;
y = G*x+b;

y1 = G*x1+b;
y2 = G*x2+b;

%{
figure;
title('First plot');
xlabel('t (in seconds)');
ylabel('y(t)');
plot(x,y);
grid on
%}

figure;
plot(y1);
title('x1(t)');
xlabel('t (in seconds)');
ylabel('y1(t)');
ylim([-5 5])
grid off

figure;
plot(y2);
title('x2(t)');
xlabel('t (in seconds)');
ylabel('y2(t)');
ylim([-5 5])
grid off

a1 = 1;
a2 = 1;

%problem 3
x3 = a1*x1 + a2*x2;

figure;
plot(x3);
title('x3(t)');
xlabel('t (in seconds)');
ylabel('y(t)');
ylim([-5 5])
grid off

%problem 6
t = -1:0.01:3;

sinusoid_x1 = 2*cos(2*pi*t - (pi/4));
sinusoid_x2 = 1.5*cos(3*pi*t - (pi/4));

sinusoid_y1 = G*sinusoid_x1+b;
sinusoid_y2 = G*sinusoid_x2+b;

figure;
subplot(2,1,1)
plot(t,sinusoid_x1)
title('x1(t) = 2*cos(2*pi*t-(pi/4))');
ylabel('y1(t)');

subplot(2,1,2)
plot(t,sinusoid_x2)
title('x2(t) = 1.5*cos(3*pi*t-(pi/4))');
ylabel('y2(t)');

%problem 7 (how many subplots 2, or 3?
a1_2 = 3;
a2_2 = 4;

x3_2 = a1_2*sinusoid_x1  + a2_2*sinusoid_x2;

y3_2 = a1*sinusoid_y1  + a2*sinusoid_y2;

figure;

subplot(3,1,1)
plot(x3_2);
title('yn(t) = 3x1(t) +4x2(t)');
xlabel('t (in seconds)');
ylabel('x3(t)');
ylim([-15 15])

subplot(3,1,2)
plot(y3_2);
title('yn(t) = 3y1(t) +4y2(t)');
xlabel('t (in seconds)');
ylabel('y3(t)');
ylim([-15 15])
grid off

%problem 9
%{
t = -7:0.01:7;
x_unit = heaviside(t+1) - heaviside(t-2);
y_t = x_unit(2*t);

figure;

plot(t,x_unit)
ylim([-5 5])
%}