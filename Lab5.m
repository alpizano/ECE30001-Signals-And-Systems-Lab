clc; 
clear;

% Task 1
e = exp(1);
dt = 0.02;
t = 0:dt:1.2;
a = 10;
h = a.*e.^(-a*t);

figure;
plot(t,h)
title('h(t) against t')
xlabel('')
ylabel('')

% Task 2
ys = 1-e.^(-a*t);

figure;
plot(t,ys)
title('ys(t) against t')
xlabel('')
ylabel('')

% Task 3
dr = [1 10]
nr = [10]

% invoking transfer function
sys = tf(nr,dr)

impulse_h = impulse(sys,t)
figure;
plot(t,impulse_h)
title('plot of impulse')
xlabel('')
ylabel('')

% Task 4
step_funct = step(sys,t)
figure;
plot(t,step_funct)
title('plot of step response')
xlabel('')
ylabel('')


% Task 5, derive second order differential eqauation
R = 4;
L = 4*e^-3;
C = 1000e-6;
% LC*D2y + RC*Dy + y = x

% Task 6, impulse response of circuit


% Task 7
% syntax for 'dsolve'
% dSolve('eqn','Initial Conditions','x')
% intitial conditions should be = 0

% for second order eq use D2y for d^2y/dt^2
% Dy for dy/dt

% dSolve('LC*D2y + RC*Dy + y = x', 'y(0)=0', 'Dy(0)=1')
% ezplot()

% Final steady state response
% Ss = 1 + 1.005.*e.^-5*t*cos(49.75*t+174.26) for t>=0