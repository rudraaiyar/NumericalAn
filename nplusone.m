f=@(x) (x.^2-3*x+2)*atan(x);
x0=0;
h1= 10.^(-1);
h3= 10.^(-3);
h6= 10.^(-6);

[FD1] = forward(f,h1,x0)
[FD3] = forward(f,h3,x0)
[FD6] = forward(f,h6,x0)

[CD31] = center3d(f,h1,x0)
[CD33] = center3d(f,h3,x0)
[CD36] = center3d(f,h6,x0)

[CD51] = center5d(f,h1,x0)
[CD53] = center5d(f,h3,x0)
[CD56] = center5d(f,h6,x0)

x = linspace(-10*pi,10*pi);
%y = (x.^2-(3*x)+2) * atan(x);
y = (x.^2-(3*x)+2 *atan(x));
loglog(x,y)


function d = forward(f,h,x0)
 d = (f(x0+h)-f(x0))/(h);
end

function d = center3d(f,h,x0)
 d = (f(x0+h)-f(x0-h))/(2*h);
end

function d = center5d(f,h,x0)
 d = (-1*f(x0+2*h)+8*f(x0+h)- 8*f(x0-h)+f(x0-2*h))/(12*h);
end