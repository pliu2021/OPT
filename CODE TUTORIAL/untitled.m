x1=[-pi:0.1:pi];
x2=x1;
[X1,X2]=meshgrid(x1,x2);
g=4*sin(x1)+sin(5*x1).*4*sin(x2)+sin(3*x2);
surf(x1,x2,g)
contourf(x1,x2,g)
