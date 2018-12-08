clear
clc
close all

% Part 1

[R,P,k] = residue(2500,[1 10 2500]);
disp('Part 1')
disp(P)

% Part 3
syms s

H = 2500/(s^2+10*s+2500);
h = ilaplace(H);
disp('Part 3')
disp(h)

t = 0.3;
tmp = (500*11^(1/2)*exp(-5*t)*sin(15*11^(1/2)*t))/33;
disp(tmp)

% Part 4

[R,P,k] = residue(2500,[1 10 2500 0]);
H = 2500/(s^3+10*s^2+2500*s);
h = ilaplace(H);

disp('Part 4')
disp(h)
disp(P)
disp(R)
disp(k)

% Part 5

H = tf(1,[1 10]);
figure
bode(H)

% Part 7

H = tf(2500,[1 100 2500]);
figure
bode(H);
grid on
