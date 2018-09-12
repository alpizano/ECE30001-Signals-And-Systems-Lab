clc
clear

t = -1.0:0.01:3.0;

%part 1.
%did this manually with for loop instead of function
for i=1:length(t)
    if t(i)>= 0
        x(i) = 1;
    else
        x(i) = 0;
    end
end

figure;
plot(t,x)
title('Function x(t)')
xlabel('t (seconds)')
ylabel('u(t)')

%part 2 w/ delay of 0.1 seconds
t2 = -1.0:0.01:3.0;
for i=1:length(t2)
    if t2(i)>= 0.1
        y(i) = 1;
    else
        y(i) = 0;
    end
end

figure;
plot(t2,y)
title('Delayed signal y(t-d)')
xlabel('t (seconds)')
ylabel('y(t)')

%part 3
t3 = -1.0:0.01:3.0;

omega = 2*pi;
f = 1;
dt = 0.01;
d = 0.4;

for k=1:length(t3)
    if t2(i)>= 0.4
        y(i) = 1;
    else
        y(i) = 0;
    end
end

figure;
subplot(2,1,1)
plot(t,x)
title('Original function x(t)')
xlabel('t (seconds)')
ylabel('x(t)')

subplot(2,1,2)
plot(t,y)
title('Delayed signal y(t)')
xlabel('t (seconds)')
ylabel('y(t)')

%part 4
delayed_sig1 = 1.5*cos(2*pi*f*-0.9-(pi/4))
delayed_sig2 = 1.5*cos(2*pi*f*0-(pi/4))
delayed_sig3 = 1.5*cos(2*pi*f*0.4-(pi/4))
delayed_sig4 = 1.5*cos(2*pi*f*0.5-(pi/4))
delayed_sig5 = 1.5*cos(2*pi*f*1.0-(pi/4))
delayed_sig6 = 1.5*cos(2*pi*f*2.0-(pi/4))
delayed_sig7 = 1.5*cos(2*pi*f*3.2-(pi/4))

%part 5 pulse
t_test = -2:0.01:2;

A = 3.5;
a = 4;
%dt = 0.01 %sampling time


for k=1:length(t_test)
    if 0 <= t_test <= a
        p(k) = A;
    else
        p(k) = 0;
    end
end

figure;
plot(t_test, p)
xlim([-5 5])
ylim([0 5])

% part 6 pulse a second way
t = -5:0.01:5;
f2 = 3.5*heaviside(t+2)-3.5*heaviside(t-2)
figure;
plot(t,f2);
ylim([0 5])

% part 7 ramp
t = -2:0.01:9
f3 = 3*(t+2).*heaviside(t+2)-6*(t).*heaviside(t)+3*(t-2).*heaviside(t-2)
plot(t, f3)