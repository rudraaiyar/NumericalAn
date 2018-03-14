f=@(t,y) (sin(2*t)-2*t*y)/(t^2);
a=1;
b=5;
alpha=2;
[y0]=euler_timestep(f,a,b,alpha,10)
[y1]=euler_timestep(f,a,b,alpha,10^2)
[y2]=euler_timestep(f,a,b,alpha,10^3)

plot(y0)
plot(y1)
plot(y2)
loglog(y0)
loglog(y1)
loglog(y2)


function [y] = euler_timestep(f,a,b,alpha,n)
    dx = (b-a)/n;
    x(1) = a;
    y(1) = alpha;
        for k=1:n
        x(k+1)=x(k) + dx;
        y(k+1)= y(k) + f(x(k),y(k))*dx;
        end
    y = y';
end