%%
%%PROBLEM 9   ---------------------------------------
t=[-2:.01:10];

for i=0:9
    if i<=2
    x(i+1)=i;
    end
    
    if i>2&i<=6
    x(i+1)=2;
    end
    
    if i>6&i<=9   
    x(i+1)=2/3*(9-i);
    end
end 
plot([0:9],x);
axis([-3 ,10 ,-2 ,4]);
ylabel("Ramp(t)")
xlabel("time ")
title("Ramp Function ")
grid on