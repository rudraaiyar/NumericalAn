function y = Lagrange_poly(x,xdata,~, N)

y = 0*x;
 


for idx= 0;N;
   Li= 0*x+1;
   for jdx= 0:N
       if idx~= jdx
           xi=xdata(idx+1);
           xj=xdata(jdx+1);
           Ln = (x-xj)/ (xi-xj);
           Li=Li.*Ln;
       end
       end
    y=y+Li*fdatay(idx+1);
end 

y=exp(-x.^2);
x= -5:1:5;



