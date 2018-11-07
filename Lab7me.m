load Lab7a

%PART1
figure;
plot(1000*t,x)
title('Full wave rectified sinusoid')
xlabel('time (milli-seconds)')
ylabel('x(t)')
grid on

%PART2
T = 1/120 % funamental period
w0 = 2*pi/T % omega, T is 1/120
w = 240*pi; % other w(omega) value (should be same as 2pi/T)
dt =(1/10000); %sampling time
%test_vector = 0:dt:(1/60);
x3=0;
x10=0;
x50=0;
x100=0;
A = 1; %amplitude is 1
e = exp(1);

%%xp = ((2*A)/pi) + ((4*A)/pi) 

% for 3 Harmonics
for k = -3:3
    x3 = x3 + ((-2*A)/(pi*(4*k*k-1))).*(e.^(i*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x3)
end

error3 = sum((x(:)-real(x3(:))).^2)

figure;
plot(1000*t,real(x3))
title('3 harmonics of x(t)')
xlabel('t')
ylabel('x(t)')
grid on

% for 10 Harmonics
for k = -10:10
    x10 = x10 + ((-2*A)/(pi*(4*k*k-1))).*(e.^(i*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x10)
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
    x50 = x50 + ((-2*A)/(pi*(4*k*k-1))).*(e.^(i*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x50)
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
    x100 = x100 + ((-2*A)/(pi*(4*k*k-1))).*(e.^(i*k*w*t));
    fprintf('The coefficient C%d is %0.4f \n',k,x100)
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

%part5
A = 10;
a = 0.003; %3ms
T = 0.008; %8 ms
t_rect = -0.008:0.00002:0.008;
t_vect = -0.011:0.00002:0.011;

%{
xt = A*rectpuls(t_rect,0.006);

%rectpulse method
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

tm1 =find( t_rect >= -8e-3 & t_rect <= -5e-3);
x (tm1) = A;

tm1_0 = find( t_rect >= -5e-3 & t_rect <= -3e-3);
x(tm1_0) = 0;

tm2 =find( t_rect >= -3e-3 & t_rect <= 3e-3);
x(tm2) = A;

tm2_0 = find( t_rect >= -5e-3 & t_rect <= -3e-3);
x(tm2_0) = 0;

tm3 =find( t_rect >= 5e-3 & t_rect <= 8e-3);
x(tm3) = A;

tm3_0 = find( t_rect >= 3e-3 & t_rect <= 5e-3);
x(tm3_0) = 0;


tm4_0 = find( t_rect >= 11e-3);
x(tm4_0) = 0;

figure;
plot(tm1,x(tm1))
ylim([0 50])
xlabel('t in milliseconds')
 
hold on
plot(tm1_0, x(tm1_0))

plot(tm2,x(tm2))
plot(tm2_0, x(tm2_0))

plot(tm3,x(tm3))
plot(tm3_0, x(tm3_0))

plot(tm4_0, x(tm4_0))

