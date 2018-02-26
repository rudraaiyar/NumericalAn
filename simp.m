a=0;
b=pi;
f= @(t) cos((pi*t.^2)/2);

[I3] = composite_simpsons(a,b,10.^3,f);
[I4] = composite_simpsons(a,b,10.^5,f);

x = linspace(-2*pi,2*pi);
y = cos((pi*x.^2)/2);
loglog(x,y)

function I = composite_simpsons(a,b,n,f)
    h = (b-a)/n;
    x = zeros(1,n+1);
    x(1) = a;
    x(n+1) = b;
    p1 = 0;
    p2 = 0;
    p3 = 0;
    
    for i = 2:n
        x(i) = a + (i-1)*h;
    end

    for i =1:n/2
        p1 = p1 + f(x(2*i-1));
    end
    
    for i =1:n/2
        p2 = p2 + f(x(2*i));
    end

    for i =1:n/2
        p3 = p3 + f(x(2*i+1));
    end
    
    I = (h/3)*(p1+4*p2+p3)
end