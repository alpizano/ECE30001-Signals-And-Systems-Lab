clc;
clear;

%Part 2 
t=-2:.1:10;
x1(1:length(t))=1.2;
x2(1:length(t))=-1.2;
y1=sys_resp(x1);
y2=sys_resp(x2);
plot(t,y1,t,y2)
ylim([-3,4])
xlabel('time')
ylabel('y1(t) and y2(t)')
title('system response')
legend y1(t) y2(t)

%{
%Part 3
x3=x1+x2;
y3=sys_resp(x3);
plot (t,y3,'--')
hold on

%part 4
Yn=y1+y2;
plot(t,Yn)
axis([-2,2 -2 2])
legend y(x3) y1+y2
xlabel('Time')
ylabel('Y(t)')
title('Part 3 and 4')

%part 6
t1=-1:.01:3;
X1=2*cos(2*pi*t1-pi/4);
X2=1.3*cos(3*pi*t1-pi/4);
Y1=sys_resp(X1);
Y2=sys_resp(X2);
subplot(2,2,1), plot (t1,X1), title('X1');
subplot(2,2,2), plot(t1,X2),title('X2');
subplot(2,2,3), plot (t1,Y1), title('Y1');
subplot(2,2,4), plot (t1,Y2), title('Y2');
pause(2)
close all

%Part 7
X3=3*X1+4*X2;
Y3=sys_resp(X3);
YN=3*Y1+4*Y2;
subplot(3,1,1), plot(t1,X3),title('X3');
subplot(3,1,2), plot (t1,Y3), title('Y3');
grid on
subplot(3,1,3), plot(t1,YN), title('Yn');
grid on 
%Part 9
clc
clear
t=-7:.01:7;
x=heaviside(t+1)- heaviside(t-2);
y=(heaviside(2*t+1)- heaviside(2*t-2));
subplot (2,1,1), plot(t,x), title('x'), xlabel('t'), ylabel('x(t)'), axis([-2 3 0 2]);
subplot(2,1,2), plot(t,y), title('y'), xlabel('t'), ylabel('x(2*t)'),axis([-2 3 0 2]);
clc 

%part 10
xd=heaviside(t-2+1)- heaviside(t-2-2);
yd=heaviside(2*t-2+1)- heaviside(2*t-2-2);
subplot (3,1,1), plot(t,xd), title('xd'), xlabel('t'), ylabel('x(t-2)'), axis([-1 4.5 0 2]);
subplot(3,1,2), plot(t,yd), title('yd'), xlabel('t'), ylabel('x(2t-2)'),axis([-1 4.5 0 2]);

%Part 11
y_del=(heaviside(t-2+1)- heaviside(t-2-2));
subplot (3,1,3), plot(t,xd), title('Ydel'), xlabel('t'), ylabel('Y(t-2)'), axis([-1 4.5 0 2]);
close all
%part 12

t=-4:.01:6;
for i=1:length(t)
if  t(i)<=-2
X(i)=0;

elseif  t(i)<=0
  
X(i)=1.5*t(i)+3; 

elseif  t(i)<=4
X(i)=3-.75*t(i);

else 
X(i)=0;
 
end

end
plot(t,X)
title ('piece wise')
xlabel('t')
ylabel('x(t)')

% Part 13
t=-4:.01:6;
T=2.*t
for i=1:length(T)
if  T(i)<=-2
Y(i)=0;

elseif  T(i)<=0
 
Y(i)=(1.5*T(i)+3); 

elseif  T(i)<=4
Y(i)=3-.75*T(i);

else 
Y(i)=0;

end
 
end
hold on
plot(t,Y)
title('Compressed')
xlabel('t')
ylabel('x(2t)')

%problem 14
t_dec=t-1;
for i=1:length(t)
if  t_dec(i)<=-2
Xd(i)=0;

elseif  t_dec(i)<=0
 
Xd(i)=1.5*t_dec(i)+3; 

elseif  t_dec(i)<=4
Xd(i)=3-.75*t_dec(i);

else 
Xd(i)=0;

end

end
plot(t,Xd)
title ('Xd')
xlabel('t')
ylabel('x(t-1)')

%Prob 14 b
 %Prob 14 ongoing 
T_compressed=(2*t_dec)
for i=1:length(t)
if  T_compressed(i)<=-2
Yd(i)=0;

elseif  T_compressed(i)<=0
 
Yd(i)=1.5*T_compressed(i)+3; 

elseif  T_compressed(i)<=4
Yd(i)=3-.75*T_compressed(i);

else 
Yd(i)=0;

end

end
plot(t,Yd)
title ('Xd compressed')
xlabel('t')
ylabel('x(2*(t-1))')

%Prob 14 c 
T_dec=T-1
for i=1:length(t)
if  T_dec(i)<=-2
Ydc(i)=0;

elseif  T_dec(i)<=0
 
Ydc(i)=1.5*T_dec(i)+3; 

elseif  T_dec(i)<=4
Ydc(i)=3-.75*T_dec(i);

else 
Ydc(i)=0;

end

end
plot(t,Ydc)
title ('Xd compressed and delayed once again')
xlabel('t')
ylabel('x(2*(t-1))')
%Problem 15

subplot (3,1,1), plot(t,Xd),title ('Xd') ,xlabel('t'), ylabel('x(t-1)'),grid on;
subplot (3,1,2), plot(t,Yd)
title ('Yd')
xlabel('t')
ylabel('x(2*(t-1))')
grid on;
subplot(3,1,3), plot(t,Ydc)
title ('Ydc')
xlabel('t')
ylabel('x(2*(t-1)-1)');
grid on 

function [y]=sys_resp(x)
y=2*x+.5;
end
%}