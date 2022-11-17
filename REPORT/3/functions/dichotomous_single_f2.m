function min_dichotomous_single_f2 = dichotomous_single_f2(xmin,xmax)
r = 0.001 ;%stop condition : minimal interval length
t = 100000 ;%stop condition : calculation times


    for i = 1:1:t
        L = xmax - xmin ;
        epsilon = 0.1*L ;
        x1 = (xmin + xmax - epsilon)/2 ;
        x2 = (xmin + xmax + epsilon)/2 ;
        F1 = f2(x1) ;
        F2 = f2(x2) ;
            if F1 < F2
                xmax = x2 ;
            else
                xmin = x1 ;
            end
        
    end
min_dichotomous_single_f2 = f2((xmin + xmax)/2)
M = [(xmin + xmax)/2 min_dichotomous_single_f2] ;
plot(M(1),M(2),'*','LineWidth',3)
end