
load Lab7a
% part 1
% Ck = X0/T0
% Ck = 1/T0
T0 = 1/120 % fundamental period for FWR
T = 1/60 % other T value
w0 = 2*pi/T0 % T is fundamental period
w = 2*pi/T % other w value
A = 1; %amplitude is 1

dt =(1/10000); %sampling time
new_t_vect = 0:dt:(1/60);

figure;
plot(1000*t,x)
title('Full wave rectified sinusoid')
xlabel('time (milli-seconds)')
ylabel('x(t)')
grid on

e = exp(1);

%%xp = ((2*A)/pi) + ((4*A)/pi) 

for k = -3:3
    Ck = ((-2*A)/(pi*(4*k^2-1)))*(e.^(j*k*w*x));
    fprintf('The coefficient C%d is %.0f \n',k,Ck);
end