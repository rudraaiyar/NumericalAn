f=@(t,y)-12*y;


[t0,y0]=RK2(f,0,1,20,1);

[t1,y1]=RK2(f,0,1,50,1);

[t2,y2]=RK2(f,0,1,100,1);


plot(t0,y0,t1,y1,t2,y2);
title('AHHHHH')
legend('N=20','N=50','N=100')


y=@(t)exp(-12*t);% this is the equation for the certain code
figure
Err=abs([y0(end) y1(end) y2(end)]-y(1));
loglog([20,50,100],Err,'-*')
axis tight
title('abs error')
%this method is converging


function [t,y]=RK2(f,a,b,N,y0)

%y0 is the initial condition ,that is value of y(a)

t=linspace(a,b,N+1);
h=t(2)-t(1);

y=zeros(N+1, 1);%this is the y

y(1)=y0;

for i = 1:length(t)-1%y is calculated using RK
    k1=h*f(t(i),y(i));
    k2=h*f(t(i)+h/2,y(i)+k1/2);
    y(i+1)=y(i)+k2;
    y=y'
end

end