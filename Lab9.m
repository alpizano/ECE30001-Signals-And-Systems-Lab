% Alberto Pizano
% ECE301 
% Lab 9
clc;
clear;

% PART 1
f0 = 120; % f0 is 120Hz
T = 1/120;
w0 = 2*pi/T; % w0 is 240*pi
A = 1;
e = exp(1);

k = -10:1:10;  
Ck = -2*A./(pi*(4*k.^2-1));
    

subplot(121);
stem(k*f0,abs(Ck)); %must be k*f0
title('|C_k|');
xlabel('k');
%xlim([-1200 1200]);
ylabel('|C_k|');

subplot(122);
stem(k*f0,angle(Ck)*(180/pi));
title('\Theta_k');
xlabel('k');
%xlim([-1200 1200]);
ylabel('degrees');

% PART 2


