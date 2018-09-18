t4 = -5:0.01:5;
f2 = 3.5*heaviside(t4+2)-3.5*heaviside(t4-2);
figure;
plot(t4,f2)
title('Pulse signal (second way)')
xlabel('t (seconds)')
ylabel('p(t) amplitude')
ylim([-3 5])
grid on