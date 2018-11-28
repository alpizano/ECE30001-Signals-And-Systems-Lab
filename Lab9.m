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
    
figure;
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

figure;
stem(n*f0_2, abs(Ck_2_2));
hold on;
title('|C_n| with T=10ms');
xlabel('n*f0');
%xlim([-1200 1200]);
ylabel('|C_n|');

% PART 3
a = .002
A = 1;
T = .05;
f0_3 = 1/T;
w0_3 = 2*pi*f0_3;

k = -100:1:100;
Ck_3 = ((A)./(k*pi)).*sin(k*w0_3*a);

figure;
stem(k*f0_3, abs(Ck_3));
hold on;
xlabel('k*f0');
ylabel('|Ck|');
title('|C_k| with T=50ms');


% PART 4
a = .002;
A = 1;
T_2 = 0.05;
f0_4 = 1/T_2;
w0_4 = 2*pi*f0_4;

k = -200:1:200;
Ck_4 = ((A)./(k*pi)).*sin(k*w0_4*a);

figure;
stem(k*f0_4, abs(Ck_4));
xlabel('k*f0');
ylabel('|C_k|');
title('|C_k| with T=100ms');
hold on;

% PART 5


% PART 6
a = 0.002;
df = .5;
fr = -2000:df:2000;
Xf = (a*(sin(pi*fr*a))./(pi*fr*a))

figure;
plot(fr,Xf)
grid on;
xlabel('f')
ylabel('X(f)')
title('Periodic Signal of Fig.1')

% PART 7
a = .004;
df = .5;
fr = -2000:df:2000;
Xf_2 = (a*sin(pi*fr*a))./(pi*fr*a);

figure;
plot(fr, Xf_2)
grid on;
xlabel('f')
ylabel('X(f)')
title('Fig.2 8ms Rectangular Pulse Width')

% PART 8 
a = 0.01;
df = 0.5;
fr = -2000:df:2000;
Xf_3 = (a*sin(pi*fr*a))./(pi*fr*a);

figure;
plot(fr,Xf_3)
grid on;
xlabel('f')
ylabel('X(f)')
title('Fig.2 20ms Rectangular Pulse Width')