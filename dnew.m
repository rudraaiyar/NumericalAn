
x=-3:0.01:3;
datx=-3:1:3;
daty=f1(datx);
f1= @(x) exp(-x.^2);

[ P5 ] = Newtons_divided_differences(x,datx,daty);

function [ P5 ] = Newtons_divided_differences(x,datx,daty)

    for j=1:length(x)
        for i=1:length(datx)-1
            f1(ii)=(daty(ii+1)-daty(ii))/(datx(ii+1)-datx(ii));
        end
        f2=(f1(2)-f1(1))/(datx(3)-datx(1));  
        P5(j)=daty(j)+(x(j)-datx(1))*f1(1)+(x(j)-datx(1))*(x(j)-datx(2))*f2;
    end
end