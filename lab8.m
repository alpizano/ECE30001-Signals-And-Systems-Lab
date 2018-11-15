% Alberto Pizano
% ECE301 
% Lab 8
clc;
clear;

dt = 1/10000;
t = 0:dt:1/60;
w = 240*pi;
A = 1;
% values of the time constants (ms)
RC1 = 1e-3;
RC2 = 10e-3;
RC3 = 50e-3;
RC4 = 100e-3;
RC5 = 500e-3;
xt = 0; % full wave rectified input signal
yt = 0; %peak to peak

e = exp(1);

% for loop to calculate harmonics
for k = -100:100
    xt = xt + (-2*A/(pi*(4*k.^2-1))*e.^(j*k*w*t));
    yt = yt + ((1/(1+(j*RC5*w*k)))*(-2*A/(pi*(4*k.^2-1))*exp(j*k*w*t)));
end

figure 
plot(t,real(xt))
hold on
plot(t,real(yt));
hold off
title(['RC (time constant) = ',num2str(RC5)])
xlabel('time (ms)');
ylabel('x(t) + y(t)');

T = (2*pi)/w;
peak2peak=max(yt)-min(yt);
meanVal=mean(yt);
approxxRip=T/RC5;
fprintf('Peak-to-peak value is: %f \n', peak2peak)
fprintf('Mean value is: %f \n', meanVal)
fprintf('Approximate ripple (T/RC) value is: %f \n', approxxRip)
