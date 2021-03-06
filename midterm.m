clc
clear


load Prob1Monday.mat

%{
DT = 0.1;
%L = length(g);
%LH = (L-1)/2;
%n = -LH:1:LH;
%t = n*DT;

figure;
plot(t, g)
title('#1 midterm funct. g(t)')
ylabel('g(t)')
xlabel('t in seconds')
%axis([-3 3 -4 4])
grid on

hold on
g_rev = -g;
plot(t,g_rev)
title('#1 midterm reversed g(t)')
ylabel('g(t)')
xlabel('t in seconds')
%axis([-3 3 -4 4])

% PROBLEM 2

t2=[-2:.01:10];
%t_midterm = [-3:0.1:3];
%t_midterm_paper = [-5:0.01:8];
%}
for i=1:5
    if i<= 1
    x(i+1)=3*(i+2);
    end
    
    if i>1 & i<=3
    x(i)=3;
    end
    
    if i>3&i<=5   
    x(i)= -1;
    end
end 
plot([1:5],x);
axis([-3 ,10 ,-2 ,4]);
ylabel("Ramp(t)")
xlabel("time ")
title("Ramp Function ")
grid on

%PROBLEM 2

dt = 0.01;
t_midterm_paper = -5:dt:8;

for k=1:length(t_midterm_paper)
%for k=-2:3
    %if t_midterm_paper(k) <= -1
      % X(k+1)=k+6;
      
    %if t_midterm_paper(k) <= -1
          %X(k) = 3*(k)+6;
    
   if  t_midterm_paper(k) > -1 & t_midterm_paper(k) <= 1
        X(k)=3;

    elseif  t_midterm_paper(k)>1 & t_midterm_paper(k)<= 3
        X(k)= -1; 

    else 
        X(k)=0;
 
    end
end

figure;
plot(t_midterm_paper,X)
title ('piecewise')
xlabel('t')
ylabel('x(t)')
grid on