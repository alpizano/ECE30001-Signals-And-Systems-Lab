clc
clear

%HW10.11
k = -5:0.001:15;

figure;
h_k = heaviside(k + 2) - heaviside(k-2);
plot(k,h_k)

x_k = 0.7.^k.*heaviside(k);


figure;
plot(k,x_k)
ylim([0 2])

%test ramp
t = 0:0.001:10

x = 2*t.*heaviside(t);
figure;
plot(t,x)