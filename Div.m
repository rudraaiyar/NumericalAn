datx=-3:1:3;%data points
datx1=-3:0.5:3;%new data points as asked
x=-3:.01:3;%interpolation points

f1=@(x)(exp(-x.^2));%f1
f2=@(x)(1./(1+x.^2));%f2

daty=f1(datx);%y for datapoints aready defined
daty1=f2(datx1);

P1=Lagrange_poly(x,datx,f1(datx))%Test P1
P2=Lagrange_poly(x,datx,f2(datx))%values interpolated for f2
P3=Lagrange_poly(x,datx1,f1(datx1))%interpolated again
P4=Lagrange_poly(x,datx1,f2(datx1))

figure
hold on
plot(datx,f1(datx));
scatter(datx,f1(datx),'*')
scatter(x,P1)
scatter(x,P2)
scatter(x,P3)
scatter(x,P4)
legend('f1(x)','data points','P1','P3')
title('for f1')
hold off


function y=Lagrange_poly(x,datx,daty)
    l=1;
    m=size(datx,2);
    p=zeros(size(x,2),1);
    for k=1:1:size(x,2)
        for i=1:1:m
             for j=1:1:m
                if i==j
                    continue;
                else
                    l=l*(x(k)-datx(j))/(datx(i)-datx(j));
                end
             end
        end
        p(k)=p(k)+(daty(j)*l);
        l=1;
    end
    y=p;
end