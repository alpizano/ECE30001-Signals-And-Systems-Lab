clear
clc 
close all;

% Ploting Unit Step Signals
t = -1:0.01:3;
x = us(t);

x_Delayed = length(t);

for i = 1:length(t)
    if(t(i) < 0.4) 
        x_Delayed(i) = 0;
    else
        x_Delayed(i) = 1;
    end
end

figure
subplot(2,1,1)
plot(t,x)
xlabel('t')
ylabel('us(t)')
axis([-1 3 -0.5 1.5])
grid on

subplot(2,1,2)
plot(t,x_Delayed)
xlabel('t')
ylabel('us(t) Delayed')
axis([-1 3 -0.5 1.5])
grid on

% Ploting Sinusoid Signals 
w = 2*pi;
dt = 0.01;
d = 0.4;

x2 = 1.5*cos(w*1*t - (pi/4));
x2_Delayed = 1.5*cos(w*1*(t-d) - (pi/4));

figure
subplot(2,1,1)
plot(t,x2)
xlabel('t')
ylabel('x2(t)')

subplot(2,1,2)
plot(t,x2_Delayed)
xlabel('t')
ylabel('Delayed Sig(t)')

% Ploting Pulse Signal
t = -2:0.01:2;
A = 3.5;
width = 3.99;

y = A*rectpuls(t,width);

figure
plot(t,y);
xlabel('t')
ylabel('Pulse')
axis([-3 3 0 4])

% Ploting Ramp Signal
t = -2:0.01:9;
x = ramp(t);

figure
plot(t,x)
xlabel('t')
ylabel('Unit Ramp')
axis([-1 10 0 10])


% Step 9
t4 = -2:.01:10;

for i = 0:9
    if i<=2
        x(i+1)=i;
    end
    if i>2 & i<= 6
        x(i+1)=2;
    end
    if i>6 & i<=9   
        x(i+1)=2/3*(9-i);
    end
end 

plot([0:9],x);
axis([-3 ,10 ,-2 ,4]);
ylabel("Ramp(t)")
xlabel("time ")
grid on

%% Unit Step Function
function x = us(t)
% y = zeros(2,3) -- Gives a 2 x 3 matrix
% length(y) -- Returns value of 3
% size(y) -- Returns dimensions of the vector, [2,3] ([x,y])

% If vector is a column, transpose vector 
if(length(t) ~= 1)
    t = t';    
end

% Signal that wil be returned
x = length(t);

for i = 1:length(t)
    if(t(i) < 0)
        x(i) = 0;
    else
        x(i) = 1;
    end
end

end

%% Unit Ramp Function
function x = ramp(t)
    
x = zeros(length(t));

for i = 1:length(t)
    
    if(t(i) < 0)
        x(i) = 0;
    else
        x(i) = t(i);
    end
end

end

