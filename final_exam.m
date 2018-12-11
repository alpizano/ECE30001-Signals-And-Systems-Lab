clc
clear

load ExamData.mat

figure;
plot(t,g,'r')
title('g')

w=314.16;
T=.02;
syn_g_dc=(1/pi)+(1/2)*sin(w*t);
syn_g=syn_g_dc-[(2/pi)*(1/3)*cos(2*w*t)];

figure;
plot(t,syn_g)
title('syn function just dc and fundemental')
x1=sum((g(:)-real(syn_g(:))).^2);
fprintf('error is %f\n', x1) 


syn_g=0;
for n=[2 4]
syn_g=((1/(n^2-1))*cos(n*w*t))+syn_g;
end 
syn_g=syn_g_dc-(2/pi)*syn_g;

figure;
plot(t,syn_g)
title('First 5 harmonics')
x2=sum((g(:)-real(syn_g(:))).^2);
fprintf('error is %f\n', x2)


syn_g=0;
for n=[2:2:10]
syn_g=((1/(n^2-1))*cos(n*w*t))+syn_g;
end 
syn_g=syn_g_dc-(2/pi)*syn_g;

figure;
plot(t,syn_g)
title('First 5 non-zero')
x3=sum((g(:)-real(syn_g(:))).^2);
fprintf('error is %f\n', x3)
%%
%part 5


h=tf([60], [1 60]);
z=[.1:.005:500];
bode(h)
figure(5)
hold on
bode(h,z)
%%
%part 7 and 8
syn_g=0;
for n=[2]
syn_g=((1/(n^2-1))*cos(n*w*t))+syn_g;
end 
syn_g_2=syn_g_dc-(2/pi)*syn_g

response=conv(syn_g_2, 60/(60+j*w));
mag=real(response);
ang=angle(response);
figure(9)
plot(t,mag)
figure(10)
plot(t,ang*(180/pi))
