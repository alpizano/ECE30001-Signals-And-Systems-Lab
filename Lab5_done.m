%Part 1
clc
clear
a=10;
t=0:.02:1.2;
u=t>=0; 
h=(a*exp(-a*t)).*u;
plot(t,h)
title('H(t)')
xlabel('t')
ylabel('h')
grid on
xlim([-.1,.75])
%%
%Part 2
 y=(1-exp(-a*t)).*u;
 plot(t,y);
 title('Ys(t)');
 xlabel('t');
 ylabel('y');
 grid on
 axis([0,.7,-.5,1]);
%%
 
%part 3 
dr=[1 10];
nr=[10];
%%sys=tf(nr,dr)
%%H=impulse(t,sys);
subplot(4,1,1), plot(t,h), title('Part1');
subplot(4,1,2), plot(t,y), title('Part2');
subplot(4,1,3),plot(t,H),title('Part3');
%part 4
%%
step=step(sys,t);
subplot(4,1,4), plot(t,step), title('part4');
 %%
 %Part 5 
 %Trans=(1/L*C)/(s^2+(R/L)*s+(1/L*C));
 %part 6
 R=4;L=400*10^-3;C=1000*10^-6 ;
 numerator=[1/(L*C)];
 denominator=[1,(R/L),1/(L*C)];
 syss=tf(numerator,denominator)
 M=impulse(syss,t);
 plot(t,M)
title('cap Voltage')
%%
%part 7
syms z(t);
R=4;
L=0.4;
C=1000e-6;
Dz=diff(z,t);
D2z=diff(Dz,t);
cond=[z(0)==0 , Dz(0)==1];
v=dsolve(C*R*Dz+C*L*D2z+z==1, cond)
ezplot(t,v) 
axis([-.5,2,-.5,3])
title('part 7')
%%
%part 8
VV=dsolve(C*R*Dz+C*L*D2z+z==u, cond)
ezplot(t,VV) 
axis([-.5,2,-.5,3])