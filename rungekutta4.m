f=@(t,y)-12*y;

[t3,y3]=RK4(f,0,1,20,1);
[t4,y4]=RK4(f,0,1,50,1);
[t5,y5]=RK4(f,0,1,100,1);

plot(t3,y3,t4,y4,t5,y5);
title('BLEH')
legend('N=20','N=50','N=100')

y=@(t)exp(-12*t);%this is the equation given

figure
Err1=abs([y3(end) y4(end) y5(end)]-y(1));

loglog([20,50,100],Err1,'-*')
axis tight
title('absolute error at t=1')
%the method is converging

function [t,y]=RK4(f,a,b,N,y0)
    
t=linspace(a,b,N+1);
h=t(2)-t(1);
y=zeros(N+1, 1);%this is the y value
y(1)=y0;
    for i = 1:length(t)-1 %this is the loop that has y in RK4
        k1=f(t(i),y(i));
        k2=f(t(i)+h/2,y(i)+k1*h/2);
        k3=f(t(i)+h/2,y(i)+k2*h/2);
        k4=f(t(i)+h,y(i)+k3*h);
        phi = (k1+2*k2+2*k3+k4)/6;
        y(i+1) = y(i) + phi*h;
        y=y'
    end
end