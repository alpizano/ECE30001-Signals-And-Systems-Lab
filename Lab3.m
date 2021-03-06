% Alberto Pizano
% ECE301
% Lab 3 - Generation of Some Basic CT Signals
% 9/17/2018

clc;
clear;

t = -1.0:0.01:3.0;

%part 1 ------------------------------------------------------------------
for i=1:length(t)
    if t(i)>= 0
        x(i) = 1;
    else
        x(i) = 0;
    end
end

figure;
plot(t,x)
title('Function u(t)')
xlabel('t (seconds)')
ylabel('u(t)')
ylim([-3 3])
grid on
%--------------------------------------------------------------------------

%part 2 w/ delay of 0.1 seconds part A)------------------------------------
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
ylim([-3 3])
grid on
%-------------------------------------------------------------------------

%part 2 part B)-----------------------------------------------------------
dt = 0.01;
t3 = -1.0:dt:3.0;
f = 1;
omega = 2*pi*f;
d = 0.4;

x = 1.5*cos(omega*t3-(pi/4));
y = 1.5*cos(omega*(t3-d)-(pi/4));

%{
for k=1:length(t3)
    if t3(i)>= 0.4
        y(i) = 1;
    else
        y(i) = 0;
    end
end
%}

figure;
subplot(2,1,1)
plot(t3,x)
title('Original function x(t)')
xlabel('t (seconds)')
ylabel('x(t)')
ylim([-3 4])
grid on

subplot(2,1,2)
plot(t3,y)
title('Delayed signal y(t)')
xlabel('t (seconds)')
ylabel('y(t)')
ylim([-3 4])
grid on
%--------------------------------------------------------------------------

%part 4 table 1------------------------------------------------------------
x_of_t1 = 1.5*cos(omega*-0.9-(pi/4))
x_of_t2 = 1.5*cos(omega*0-(pi/4))
x_of_t3 = 1.5*cos(omega*0.4-(pi/4))
x_of_t4 = 1.5*cos(omega*0.5-(pi/4))
x_of_t5 = 1.5*cos(omega*1.0-(pi/4))
x_of_t6 = 1.5*cos(omega*2.0-(pi/4))
x_of_t7 = 1.5*cos(omega*3.2-(pi/4))

x_of_t8 = 1.5*cos(omega*3.3-(pi/4))
x_of_t9 = 1.5*cos(omega*3.8-(pi/4))

y_of_t1 = 1.5*cos(omega*(-0.9-d)-(pi/4))
y_of_t2 = 1.5*cos(omega*(0-d)-(pi/4))
y_of_t3 = 1.5*cos(omega*(0.4-d)-(pi/4))
y_of_t4 = 1.5*cos(omega*(0.5-d)-(pi/4))
y_of_t5 = 1.5*cos(omega*(1.0-d)-(pi/4))
y_of_t6 = 1.5*cos(omega*(2.0-d)-(pi/4))
y_of_t7 = 1.5*cos(omega*(3.2-d)-(pi/4))

y_of_t8 = 1.5*cos(omega*(3.3-d)-(pi/4))
y_of_t9 = 1.5*cos(omega*(3.8-d)-(pi/4))
%--------------------------------------------------------------------------

%part 5 rectpulse----------------------------------------------------------

t=(-2:.01:2);
x=rectpuls(t,3.99);
figure ()
plot(t,3.5*x)
ylabel("amplituide")
xlabel("time ")
title("Pulse Function ")
axis([-3 3 -3 5])
grid on 


%{
dt = 0.01 
t_test = -2:dt:2;
A = 3.5;
a = 4;

for k=1:length(t_test)
    if -2 <= t_test <= 2
        p(k) = A;
    else
        p(k) = 0;
    end
end

figure;
plot(t_test, p)
title('Pulse signal)')
xlabel('t (seconds)')
ylabel('x(t) amplitude')
xlim([-5 5])
ylim([0 5])
%}

%part 6 pulse a second way ------------------------------------------------
t4 = -5:0.01:5;
f2 = 3.5*heaviside(t4+2)-3.5*heaviside(t4-2);
figure;
plot(t4,f2)
title('Pulse signal (second way)')
xlabel('t (seconds)')
ylabel('p(t) amplitude')
ylim([-3 5])
grid on
%--------------------------------------------------------------------------

%part 7 sketch of g(t) ----------------------------------------------------
t5 = 0:0.01:9;
f3 = 3*(t5+2).*heaviside(t5+2)-6*(t5).*heaviside(t5)+3*(t5-2).*heaviside(t5-2);
figure;
plot(t5, f3)
title('Sketch of g(t)')
xlabel('t (seconds)')
ylabel('g(t)')
grid on
%--------------------------------------------------------------------------

%part 8/9------------------------------------------------------------------
t6=[-2:.01:10];

for i=0:9
    if i<=2
    x2(i+1)=i;
    end
    
    if i>2&i<=6
    x2(i+1)=2;
    end
    
    if i>6&i<=9   
    x2(i+1)=2/3*(9-i);
    end
end 

figure;
plot([0:9],x2);
axis([-3 ,10 ,-2 ,4]);
ylabel("Ramp(t)")
xlabel("time ")
title("Ramp Function ")
grid on