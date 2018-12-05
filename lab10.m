%1
a = [2500];
b = [1 10 2500];
[r, p, k] = residue(a, b)
figure(1)
plot(real(p(1)), imag(p(1)),'*')
hold on
plot(real(p(2)), imag(p(2)), '*')
xlabel("Real")
ylabel("Imaginary")
hold off

%3
syms s;
H = (2500)/(s*s + 10*s +2500);
h = ilaplace(H)

%4
c = [1 10 2500 0];
[R, P, K] = residue(a, c)
Y = (2500)/((s*s + 10*s +2500)*s);
y = ilaplace(Y)

%5
d = [1 10];
w = logspace(-1,5);
freqs(b, a, w)


