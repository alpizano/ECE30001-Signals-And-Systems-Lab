%%
clc;
clear;

%problem 2; sys_rep

G = 2;
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
plot(x3,'--');
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

%Part 9
t=-7:.01:7;
x=heaviside(t+1)- heaviside(t-2);
y=(heaviside(2*t+1)- heaviside(2*t-2));
figure;
subplot (2,1,1), plot(t,x), title('x(t)'), xlabel('t'), ylabel('x(t)'), axis([-2 3 0 2]);
subplot(2,1,2), plot(t,y), title('y(t)'), xlabel('t'), ylabel('x(2*t)'),axis([-2 3 0 2]);

%part 10
xd=heaviside(t-2+1)- heaviside(t-2-2);
yd=heaviside(2*t-2+1)- heaviside(2*t-2-2);
figure;
subplot (3,1,1), plot(t,xd), title('xd'), xlabel('t'), ylabel('x(t-2)'), axis([-1 4.5 0 2]);
subplot(3,1,2), plot(t,yd), title('yd'), xlabel('t'), ylabel('x(2t-2)'),axis([-1 4.5 0 2]);

%Part 11
y_del=(heaviside(t-2+1)- heaviside(t-2-2));
figure;
subplot (3,1,3), plot(t,xd), title('Ydel'), xlabel('t'), ylabel('Y(t-2)'), axis([-1 4.5 0 2]);
close all

%part 12
t=-4:.01:6;
for i=1:length(t)
if  t(i)<=-2
X(i)=0;

elseif  t(i)<=0
  
X(i)=1.5*t(i)+3; 

elseif  t(i)<=4
X(i)=3-.75*t(i);

else 
X(i)=0;
 
end

end
figure;
plot(t,X)
title ('piecewise')
xlabel('t')
ylabel('x(t)')


% Part 13
t=-4:.01:6;
T=2.*t
for i=1:length(T)
if  T(i)<=-2
Y(i)=0;

elseif  T(i)<=0
 
Y(i)=(1.5*T(i)+3); 

elseif  T(i)<=4
Y(i)=3-.75*T(i);

else 
Y(i)=0;

end
 
end
hold on
figure;
plot(t,Y)
title('compressed piecewise')
xlabel('t')
ylabel('x(2t)')


%problem 14
t_dec=t-1;
for i=1:length(t)
if  t_dec(i)<=-2
Xd(i)=0;

elseif  t_dec(i)<=0
 
Xd(i)=1.5*t_dec(i)+3; 

elseif  t_dec(i)<=4
Xd(i)=3-.75*t_dec(i);

else 
Xd(i)=0;

end

end

plot(t,Xd)
title ('Xd')
xlabel('t')
ylabel('x(t-1)')



%Prob 14b
T_compressed=(2*t_dec)
for i=1:length(t)
if  T_compressed(i)<=-2
Yd(i)=0;

elseif  T_compressed(i)<=0
 
Yd(i)=1.5*T_compressed(i)+3; 

elseif  T_compressed(i)<=4
Yd(i)=3-.75*T_compressed(i);

else 
Yd(i)=0;

end

end

plot(t,Yd)
title ('Xd compressed')
xlabel('t')
ylabel('x(2*(t-1))')


%Prob 14c 
T_dec=T-1
for i=1:length(t)
if  T_dec(i)<=-2
Ydc(i)=0;

elseif  T_dec(i)<=0
 
Ydc(i)=1.5*T_dec(i)+3; 

elseif  T_dec(i)<=4
Ydc(i)=3-.75*T_dec(i);

else 
Ydc(i)=0;

end

end

plot(t,Ydc)
title ('ydc compressed and delayed once again')
xlabel('t')
ylabel('x(2*(t-1))')


%Problem 15
figure;
subplot (3,1,1), plot(t,Xd),title ('Xd') ,xlabel('t'), ylabel('x(t-1)'),grid on;
subplot (3,1,2), plot(t,Yd)
title ('Yd')
xlabel('t')
ylabel('x(2*(t-1))')
grid on;
subplot(3,1,3), plot(t,Ydc)
title ('Ydc')
xlabel('t')
ylabel('x(2*(t-1)-1)');
grid on 


function [y]=sys_resp(x)
y=2*x+.5;
end



