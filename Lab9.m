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
    

subplot(211); % 
stem(k*f0,abs(Ck)); %must be k*f0
title('|C_k|');
xlabel('k');
%xlim([-1200 1200]);
ylabel('|C_k|');

subplot(212);
stem(k*f0,angle(Ck)*(180/pi));
title('\Theta_k');
xlabel('k');
%xlim([-1200 1200]);
ylabel('degrees');

% PART 2
A = 1; %pulse amplitude
a = 2e-3;
T = 10e-3;
f0_2 = 1/T; % 100
w0_2 = 2*pi/T;
dt = 1/50000;
tAxis = -12e-3:dt:12e-3;
Ck_2 = 2*a*A/T; % square wave offset

xp = zeros(1,length(tAxis));

tm1 =find(tAxis >= -T-a & tAxis <= -T+a);
xp(tm1) = A;

tm2 = find(tAxis >= -a & tAxis <= a);
xp(tm2) = A;

tm3 = find(tAxis >= T-a & tAxis <= T+a);
xp(tm3) = A;

figure;
plot(tAxis,xp)
xlabel('t in milliseconds')
title('periodic square wave')
ylabel('xp(t)')
ylim([0 4])
xlim([-T-a T+a])

for k = -3:1:3
    if k~= 0 % NOT equal to 0; dc offset
    Ck_2 = Ck_2 + A/(k*pi) * sin((2*pi*k*a)/T) * e.^(j*k*w0_2*tAxis);
    %if(k == 1 | k == 2 | k == 3)
    %fprintf('The coefficient C%d is %0.4f \n',k,squareWave);
    %end
    end
end

n = -20:1:20;
Ck_2_2 =  A./(n*pi).*sin((2*pi*n*a)./T) 


stem(n*f0_2, abs(Ck_2_2));




