%%lab 3 PROBLEM 1 -------------------------------
t=(-1:.01:3);
unitstep=t>0;
plot(t,unitstep)
ylabel("unitstep")
xlabel("time  ")
title("Function us(t)")
axis([-1 3 -3 3])
grid on 

%%PROBLEM 2 part A ---------------------------------------
t=(-1:.01:3);
unitstep=t>.1;
plot(t,unitstep)
ylabel("Delay sig")
xlabel("time  ")
title("Function delay signal")
axis([-1 3 -3 3])
grid on 

%%PROBLEM 2 part B  ---------------------------------------
t=(-1:.01:3);
y=1.5*cos(2*pi*(t)-(pi/4));
x=1.5*cos(2*pi*(t-0.4)-(pi/4));
subplot(2, 1, 1);
plot(t,x)
ylabel("Delay sig")
xlabel("time  ")
title("Function original x(t)")
axis([-1 3 -3 4])
grid on 

subplot(2, 1, 2);
plot(t,y)
ylabel("Delay sig")
xlabel("time  ")
title("Function delayed x(t)")
axis([-1 3 -3 4])
grid on 

%%PROBLEM 5   ---------------------------------------
t=(-2:.01:2);
x=rectpuls(t,3.99);
figure ()
plot(t,3.5*x)
ylabel("amplituide")
xlabel("time ")
title("Pulse Function ")
axis([-3 3 -3 5])
grid on 

%%PROBLEM 8   ---------------------------------------
t=[-2:.01:9];
figure ()
plot(t,t)
ylabel("Ramp(t)")
xlabel("time ")
title("Ramp Function ")
axis([-3 10 -3 10])
grid on 

%%
%%PROBLEM 9   ---------------------------------------
t=[-2:.01:10];

for i=0:9
    if i<=2
    x(i+1)=i;
    end
    
    if i>2&i<=6
    x(i+1)=2;
    end
    
    if i>6&i<=9   
    x(i+1)=2/3*(9-i);
    end
end 
plot([0:9],x);
axis([-3 ,10 ,-2 ,4]);
ylabel("Ramp(t)")
xlabel("time ")
title("Ramp Function ")
grid on