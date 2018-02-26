%n=10.^3;
a=0;
b=pi;
f= @(t) cos((pi*t.^2)/2);

[I1] = composite_trapezoid(a,b,10.^3,f);
[I2] = composite_trapezoid(a,b,10.^5,f);

x = linspace(-2*pi,2*pi);
y = cos((pi*x.^2)/2);
loglog(x,y)

function I = composite_trapezoid(a,b,n,f)
    result=0;  
    h = (b-a)/n; %Finding space between each subinterval
    x = [a+h:h:b-h]; %Finding midpoints of each subintervals.
    for i=1:n-1
        result =result+f(x(i));
    end
    result=h*(result+0.5*(f(a)+f(b)));
    I=result
end

%fresnelc(x)=\int_0^x cos\left(\frac{\pi t^2}{2}\right)dt;
