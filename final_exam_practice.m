clc
clear

load ExamData.mat

% PART 1
figure;
plot(t,g)
title('PART 1: function g(t)')
xlabel('t')
ylabel('g(t)')
grid on

% PART 2
T = 0.02 % period

% PART 3
f0 = 1/T % fundamental frequency
% also w0 = 2pi/T

w0 = 2*pi*f0 % fundamental frequency in radians

% PART 4 (a) dc and fundamental component only 
syn_t_dc = (1/pi);
syn_t_fund = (1/2)*sin(w0*t);
syn_t_partA = syn_t_dc + syn_t_fund;

figure;
plot(t, syn_t_partA)
title('PART 4 (a): dc and fundamental component only')
ylabel('syn(t)')
xlabel('t')
grid on

% PART 4 (b) dc + fundamental component + 2,3,4,5
syn_t_partB = 0;

for k = 2:1:5
    syn_t_partB = syn_t_partB + (1/(k^2-1)).*cos(k*w0*t) ;
end

syn_t_partB = (syn_t_dc + syn_t_fund) - (2/pi)*syn_t_partB;

figure;
plot(t, real(syn_t_partB))
title('PART 4 (b): dc and the first 5 harmonics')
xlabel('t')
ylabel('syn(t)')
grid on

% PART 4 (c) dc + fundamental component + 2,4,6,8
syn_t_partC = 0;

for n= 2:2:8
    %if k~=0
    syn_t_partC = syn_t_partC + (1/(n^2-1)).*cos(n*w0*t);
    %end
end

syn_t_partC = (syn_t_dc + syn_t_fund) - (2/pi)*syn_t_partC;

figure;
plot(t, syn_t_partC)
title('PART 4 (c): dc and the first 5 non-zero harmonics')
xlabel('t')
ylabel('syn(t)')
grid on

%{
% PART 6
nr =  [60];
dr = [1, 60];
H = tf(nr,dr); %transfer function
x = 0.1:0.005:500;

figure;
bode(H)
hold on
bode(H,x)

% PART 7,8
syn_t_2 = (2/pi)*(1/(2^2-1)).*cos(2*w0*t);
syn_t_2 = syn_t_dc - syn_t_2;

figure;
response=conv(syn_t_2, 60/(60+j*w0));
mag=real(response)
ang=angle(response)
plot(t,mag)
title('magnitude response')

figure;
plot(t,ang*(180/pi))
title('degrees response')
%}
