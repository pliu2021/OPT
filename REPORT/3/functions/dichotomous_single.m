function dichotomous_single(xmin,xmax)
r = 0.001 ;%stop condition : minimal interval length
t = 100000 ;%stop condition : calculation times
plotf(xmin,xmax)%plot the function of the interval
hold on
    for i = 1:1:t
        L = xmax - xmin ;
        epsilon = 0.1*L ;
        x1 = (xmin + xmax - epsilon)/2 ;
        x2 = (xmin + xmax + epsilon)/2 ;
        f1 = f(x1) ;
        f2 = f(x2) ;
            if f1 < f2
                xmax = x2 ;
            else
                xmin = x1 ;
            end
        
    end
min = f((xmin + xmax)/2)
plot((xmin + xmax)/2,min,'*')%plot the point of min
end

