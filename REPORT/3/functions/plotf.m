function plotf(xmin,xmax)
    x = xmin:0.1:xmax ;
    for i = 1:1:size(x,2) ;
        y(i) = f(x(i)) ;
    end
    plot(x,y)
end