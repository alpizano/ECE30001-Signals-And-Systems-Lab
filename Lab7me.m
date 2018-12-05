clc
clear

load Lab7a

%PART1
figure;
plot(1000*t,x)
title('Full wave rectified sinusoid')
xlabel('time (milli-seconds)')
ylabel('x(t)')
grid on

%PART2
%T = 1/120 % funamental period
%w0 = 2*pi/T % omega, T is 1/120
w = 240*pi; % other w(omega) value (should be same as 2pi/T)
dt1 =(1/10000); %sampling time
%test_vector = 0:dt1:(1/60);
x3=0;
x10=0;
x50=0;
x100=0;
A1 = 1; %amplitude is 1
e = exp(1);

%%xp = ((2*A)/pi) + ((4*A)/pi) 

% for 3 Harmonics
for k = -3:3
    x3 = x3 + ((-2*A1)/(pi*(4*k*k-1))).*(e.^(j*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x3);
end

error3 = sum((x(:)-real(x3(:))).^2);

figure;
plot(1000*t,real(x3))
title('3 harmonics of x(t)')
xlabel('t')
ylabel('x(t)')
grid on

test_3_dc = (2/pi)+ (4/pi) ;
% TESTING SHIT

test_3 = 0;
for n = 1:1:3
    %if n~=0
    test_3 = test_3_dc + test_3 +(((-1)^(n+1))/(4*n^2-1)).*cos(n*w*t);
    %end
end

figure(69);
%test_3 = test_3_dc + (4/pi)*test_3;
plot(1000*t, test_3)
title('fucking test')
grid on


% for 10 Harmonics
for k = -10:10
    x10 = x10 + ((-2*A1)/(pi*(4*k*k-1))).*(e.^(j*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x10);
end

error10 = sum((x(:)-real(x10(:))).^2);

figure;
plot(1000*t,real(x10))
title('10 harmonics of x(t)')
xlabel('t')
ylabel('x(t)')
grid on

% for 50 Harmonics
for k = -50:50
    x50 = x50 + ((-2*A1)/(pi*(4*k*k-1))).*(e.^(j*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x50);
end

error50 = sum((x(:)-real(x50(:))).^2);

figure;
plot(1000*t,real(x50))
title('50 harmonics of x(t)')
xlabel('t')
ylabel('x(t)')
grid on

% for 100 Harmonics
for k = -100:100
    x100 = x100 + ((-2*A1)/(pi*(4*k*k-1))).*(e.^(j*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x100);
end

error100 = sum((x(:)-real(x100(:))).^2);

figure;
plot(1000*t,real(x100))
title('100 harmonics of x(t)')
xlabel('t')
ylabel('x(t)')
grid on

%printing out error of No. of Harmonics 3,10,50, and 100 for Table 1
fprintf('Total mean squared for 3 harmonics: %f \n', error3)
fprintf('Total mean squared for 10 harmonics: %f \n', error10)
fprintf('Total mean squared for 50 harmonics: %f \n', error50)
fprintf('Total mean squared for 100 harmonics: %f \n', error100)

% PART 5
A = 10;
a = 3e-3; %3ms
T = 8e-3; %8 ms
w2 = 2*pi/T;
dt2 = 1/50000;
t_rect = -8e-3:dt2:8e-3;

%t_vect = -0.011:0.00002:0.011;

%{
xt = A*rectpuls(t_rect,0.006);

% using rectpulse method
figure;
plot(t_rect,xt);
ylim([0 50])
xlabel('t in milliseconds')
%}

%{  
rect3 = A*heaviside(t_vect+0.011) - A*heaviside(t_vect+0.005) + A*heaviside(t_vect+0.003) - A*heaviside(t_vect-0.003) + A*heaviside(t_vect-0.005) - A*heaviside(t_vect-0.011);
plot(t_vect,rect3)
ylim([0 50])
xlabel('t in milliseconds')
title('periodic rectangular wave')
ylabel('xp(t)')
%}

% using FIND function method
xp = zeros(1,length(t_rect));

tm1 =find(t_rect >= -8e-3 & t_rect <= -5e-3);
xp(tm1) = A;

%tm1_0 = find( t_rect >= -5e-3 & t_rect <= -3e-3);
%x_rect(tm1_0) = 0;

tm2 = find(t_rect >= -3e-3 & t_rect <= 3e-3);
xp(tm2) = A;

%tm2_0 = find( t_rect >= -5e-3 & t_rect <= -3e-3);
%x_rect(tm2_0) = 0;

tm3 = find(t_rect >= 5e-3 & t_rect <= 8e-3);
xp(tm3) = A;

%tm3_0 = find( t_rect >= 3e-3 & t_rect <= 5e-3);
%x_rect(tm3_0) = 0;

%tm4_0 = find( t_rect >= 11e-3);
%x_rect(tm4_0) = 0;

figure;
plot(t_rect,xp)
xlabel('t in milliseconds')
title('periodic rectangular wave')
ylabel('xp(t)')
ylim([0 50])
%xlabel('t in milliseconds')
 
%hold on
%plot(tm1_0, x_rect(tm1_0))

%plot(tm2,xp(tm2))
%plot(tm2_0, x_rect(tm2_0))

%plot(tm3,xp(tm3))
%plot(tm3_0, x_rect(tm3_0))

%plot(tm4_0, x_rect(tm4_0))

% PART 6
%only positive coefficients because even function

x_sine3 = (2*a*A)/T;
x_sine10 = (2*a*A)/T;
x_sine50 = (2*a*A)/T;
x_sine100 = (2*a*A)/T;

for k = -3:3
    if k~= 0 %dc offset
    x_sine3 = x_sine3 + A/(k*pi) * sin((2*pi*k*a)/T) * exp(j*k*w2*t_rect);
    %fprintf('The coefficient C%d is %0.4f \n',k,x_sine);
    end
end

figure;
plot(t_rect, real(x_sine3))
title('3 harmonics')
xlabel('t (ms)')
ylim([-2 12])

for k = -10:10
    if k~= 0 %dc offset
    x_sine10 = x_sine10 + A/(k*pi) * sin((2*pi*k*a)/T) * exp(j*k*w2*t_rect);
    %fprintf('The coefficient C%d is %0.4f \n',k,x_sine);
    end
end

figure;
plot(t_rect, real(x_sine10))
title('10 harmonics')
xlabel('t (ms)')
ylim([-2 12])

for k = -50:50
    if k~= 0 %dc offset
    x_sine50 = x_sine50 + A/(k*pi) * sin((2*pi*k*a)/T) * exp(j*k*w2*t_rect);
    %fprintf('The coefficient C%d is %0.4f \n',k,x_sine);
    end
end

figure;
plot(t_rect, real(x_sine50))
title('50 harmonics')
xlabel('t (ms)')
ylim([-2 12])

for k = -100:100
    if k~= 0 %dc offset
    x_sine100 = x_sine100 + A/(k*pi) * sin((2*pi*k*a)/T) * exp(j*k*w2*t_rect);
    %fprintf('The coefficient C%d is %0.4f \n',k,x_sine);
    end
end

figure;
plot(t_rect, real(x_sine100))
title('100 harmonics')
xlabel('t (ms)')
ylim([-2 12])

sine_error3 = sum((xp(:)-real(x_sine3(:))).^2);
sine_error10 = sum((xp(:)-real(x_sine10(:))).^2);
sine_error50 = sum((xp(:)-real(x_sine50(:))).^2);
sine_error100 = sum((xp(:)-real(x_sine100(:))).^2);

fprintf('Total mean squared for SINE 3 harmonics: %f \n', sine_error3)
fprintf('Total mean squared for SINE 10 harmonics: %f \n', sine_error10)
fprintf('Total mean squared for SINE 50 harmonics: %f \n', sine_error50)
fprintf('Total mean squared for SINE 100 harmonics: %f \n', sine_error100)

