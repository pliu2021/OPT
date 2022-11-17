function plotff(xmin,xmax)
    x1 = -10:0.5:10 ;
    x2 = x1 ;
    [X1,X2] = meshgrid(x1,x2) ;
    for i = 1:1:size(X1,1)
        for j = 1:1:size(X1,1)
            Y(i,j) = ff(X1(i,j),X2(i,j));
        end    
    end
    hold on
    v = [dichotomous_single_f2(xmin,xmax),1] ;
    contour(X1,X2,Y,'ShowText','on')
    contour(X1,X2,Y,v,'ShowText','on')
end