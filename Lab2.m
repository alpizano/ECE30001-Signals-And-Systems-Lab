clc
clear
load Lab2s1
DT = 0.005;
L = length(s1);
LH = (L-1)/2;
n = -LH:1:LH; %-10:1:10
t = n*DT;

figure;
plot(t,s1,'b')
xlabel('seconds')
ylabel('s1(blue) & s2(red) signals')
title('Even & odd components of signals')


%part 2
s2 = -s1;
hold on
figure;
plot(t,s2,'r')
title('Time-reversed s1')

%part 3
s3 = zeros(1,length(t));
for i=1:length(t)
    if  t(i) <= 0
        s3_neg =@(t) 3 + (3/0.05)*t(i);
        s3(i)=s3_neg(t)
        
    end
    if  t(i)>0
        s3_pos = @(t)3 - (3/0.05)*t(i);
        s3(i)=s3_pos(t)
    end
end
 
figure;
plot(t,s3,'g')
title('s3 plot')

%part 4
ssum = s1 + s3
figure;
plot(t,ssum);
title('plot of ssum(t)')
ylabel('s1 + s3')
xlabel('t,s')

% symmetry test
% value at ssum(11) = 0 %
sym_test_1 = ssum(12) == ssum(10);
sym_test_2 = ssum(14) == ssum(8);

%part 5
ssum_rev = -ssum;
s_even = (ssum + ssum_rev)/2;
s_odd = (ssum - ssum_rev)/2;

figure;
subplot(2,1,1)
plot(t,s_even)
ylabel('s even')
xlabel('t,s')


subplot(2,1,2)
plot(t,s_odd)
ylabel('s odd')
xlabel('t,s')

%part 6
t2 = -3:0.01:3-0.01;
g = 2*t2+t2.^2;

figure;
plot(t2,g)
title('plot of g(t)')

% table 2
g_rev = -g;
g_even = (g + g_rev)/2;
g_odd = (g - g_rev)/2;

figure;
subplot(2,1,1)
plot(t2,g_even)
ylabel('g even')
xlabel('t2,g')


subplot(2,1,2)
plot(t2,g_odd)
ylabel('g odd')
xlabel('t2,g')
