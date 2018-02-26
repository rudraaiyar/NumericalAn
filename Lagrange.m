%all given data

x=-3:0.01:3;
datx=-3:1:3;
f1 = exp(-x.^2);
daty = @(x) exp(-x.^2);
[P5] = Newtons_divided_differences(x,datx,daty); %calling the function

%this is how we plot

figure
x = linspace(-10,3*pi,200);
y = exp(-x.^2); 
scatter(x,y) %told to use this
plot(x,y)

% actual function

function y = Newtons_divided_differences(x,datx,daty)

    for i=1:length(x)

        for j=1:length(datx)-1

            s(j)=(daty(j+1)-daty(j))/(datx(j+1)-datx(j)); %this formula is given

        end %end inside for loop

        t=(s(2)-s(1))/(datx(3)-datx(1)); %same thing as s but sifferent locations

        y(i)=daty(i)+(x(i)-datx(1))*s(1)+(x(i)-datx(1))*(x(i)-datx(2))*t;

    end %ends the first for loop

end


 