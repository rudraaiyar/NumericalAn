a = 0;                  %time interval we are solving over
b = 1;
alpha=1;             
f =  @(t, y) -12*y; 

loglog(a);
plot(b);

[y6]=AB4(f,a,b,alpha,20)
[y7]=AB4(f,a,b,alpha,50)
[y8]=AB4(f,a,b,alpha,100)

y=@(t)exp(-12*t);%this is the equation given

figure
Err2=abs([y6(end) y7(end) y8(end)]-y(1));

loglog([20,50,100],Err2,'-*')
axis tight
title('absolute error at t=1')

function [y] = AB4(f,a,b,alpha,N)
    h = (b - a) / N;
    h24 = h / 24;
    y(1,:) = alpha;
    t(1) = a;
    m = min(3,N);

    for i = 1 : m 
        t(i+1) = t(i) + h;
        s(i,:) = f(t(i), y(i,:));
        s2 = f(t(i) + h / 2, y(i,:) + s(i,:) * h /2);
        s3 = f(t(i) + h / 2, y(i,:) + s2 * h /2);
        s4 = f(t(i+1), y(i,:) + s3 * h);
        y(i+1,:) = y(i,:) + (s(i,:) + s2+s2 + s3+s3 + s4) * h / 6;
    end

    for i = m + 1 : N 
        s(i,:) = f(t(i), y(i,:));
        y(i+1,:) = y(i,:) + (55 * s(i,:) - 59 * s(i-1,:) + 37 * s(i-2,:) - 9 * s(i-3,:)) * h24;
        t(i+1) = t(i) + h;
    end
end
%the method is converging