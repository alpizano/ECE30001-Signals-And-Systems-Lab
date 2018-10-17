

%% Unit Ramp Function

t = -1:0.01:3;
function x = ramp(t)
    
x = zeros(length(t));

for i = 1:length(t)
    
    if(t(i) < 0)
        x(i) = 0;
    else
        x(i) = t(i);
    end
end

end