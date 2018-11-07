clear
clc 
close all

% Step 1
load('Lab7a.mat')
figure
plot(t, x)
title('Full Wave Rectified Sinusoid')
xlabel('t(ms)')

% Step 2
dt = 1/10000;
t = 0:dt:1/60;

A = 1;
w = 240*pi;
x3 = 0;

for k = -100:100
    C = -2*A/(pi*(4*k^2-1));
    x3 = x3 + C*exp(j*k*w*t);
end

figure
plot(t,real(x3))
title('Synthesized Signeal using 100 Harmics')
xlabel('t(ms)')
% Step 3
fprintf('%f\n',sum((x(:)-real(x3(:))).^2))

%%
%Step 5
A = 10;
a = 3e-3;
T = 8e-3;
w = 2*pi/T;
dt = 1/50000;

t = -8e-3:dt:8e-3;

xp = zeros(1, length(t));

tm1 = find(t >= -8e-3 & t <= -5e-3);
xp(tm1) = A;

tm2 = find(t >= -3e-3 & t <= 3e-3);
xp(tm2) = A;

tm3 = find(t >= 5e-3 & t <= 8e-3);
xp(tm3) = A;

figure
plot(t, xp)
title('Periodic Rectangle Wave')
xlabel('t(ms)')
ylabel('x_p(t)')
ylim([-1 11])

% Step 7
x3 = (2*a*A)/T;

for k = -100:100
    if k~=0
        C = A/(k*pi)*sin((2*pi*k*a)/T);
        x3 = x3 + C*exp(j*k*w*t)
    end
end

figure
plot(t,real(x3))
title('Synthesized Signeal using 50 Harmics')
xlabel('t(ms)')

fprintf('%f\n',sum((xp(:)-real(x3(:))).^2))



