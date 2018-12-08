% Alberto Pizano
% Lab 10 ECE301
% 12 - 05 - 2018

clc;
clear;

% PART 1
[R,P,k] = residue(2500,[1 10 2500]);
disp(P)

figure;
plot(real(P(1)), imag(P(1)),'*')
hold on
plot(real(P(2)), imag(P(2)), '*')
xlabel("Real")
ylabel("Imaginary")
hold off
grid on

% PART 3
syms s;
H = (2500)/(s*s + 10*s +2500);
h = ilaplace(H)

disp(h)

% PART 4
[R,P,k] = residue(2500,[1 10 2500 0]);
H = 2500/(s^3+10*s^2+2500*s);
h = ilaplace(H);

disp(h)
disp(P)
disp(R)
disp(k)

% PART 5
H = tf(1,[1 10]);

figure;
bode(H)
grid on

% PART 7
H = tf(2500,[1 100 2500]);

figure;
bode(H);
grid on
