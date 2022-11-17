function plotline(xmin,xmax)
    x = [0+0.5*xmin;0+0.5*xmax] ;
    y = [1+xmin;1+xmax] ;
    plot(x,y,'LineWidth',2)
end