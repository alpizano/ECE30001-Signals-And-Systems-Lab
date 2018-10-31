%Alberto Pizano
%Lab6 ECE301

%part1
figure;
plot(newsim9.time, newsim9.Data) 
title('step')
xlabel('time')
ylabel('Data')

%part2
omega = logspace(-1,3);

angle = -atand(omega/10); %inverse tangent in degrees
H = 10./abs(10+j*omega);

figure;
subplot (2,1,1)
plot(H)
%%xticks(0.1:0.05:1000);
title('Magnitude')
xlabel('Phase')
ylabel('H(jw)')

subplot(2,1,2)
plot(angle) 
title('Phase angle')
xlabel('Phase')
ylabel('Theta')

%part 3
figure;
subplot(2,1,1)
a=[1 10];
b=10;
%%w=logspace(-1,3);
h=freqs(b,a,omega);

loglog(abs(h));
title('Magnitude')
xlabel('Phase')
ylabel('H(jw)')
grid on
subplot(2,1,2)
semilogx(angle);
title('Phase angle')
xlabel('Phase')
ylabel('Theta')
grid on