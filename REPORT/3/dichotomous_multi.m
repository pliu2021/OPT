%% Main
function dichotomous_multi()

clear all
close all

xmin = -1 ;
xmax = 1 ;

plotff(xmin,xmax) ;
plotline(xmin,xmax) ;
end

%% Plot Contours
function plotff(xmin,xmax)
    x1 = xmin:0.5:xmax ;
    x2 = x1 ;
    [X1,X2] = meshgrid(x1,x2) ;
    for i = 1:1:size(X1,1)
        for j = 1:1:size(X1,1)
            Y(i,j) = ff(X1(i,j),X2(i,j));
        end    
    end
    hold on
    v = [dichotomous_single_f2(xmin,xmax)] 
    contour(X1,X2,Y,'ShowText','on')
    contour(X1,X2,Y,v,'ShowText','on')
end

%% Plot line
function plotline(xmin,xmax)
    X0 = [0,1] ;
    d = [0.5,1] ;
    k1 = (xmax - X0(1))/d(1) ;
    k2 = (xmin - X0(1))/d(1) ;
    X1 = X0 + k1*d ;
    X2 = X0 + k2*d ;
    A = [X1(1);X2(1)] ;
    B = [X1(2);X2(2)] ;
    plot(A,B,'LineWidth',2)
end

%% Plot function line
function plotf(xmin,xmax)
    x = xmin:0.1:xmax ;
    for i = 1:1:size(x,2) 
        y(i) = f(x(i)) ;
    end
    plot(x,y)
end

%% the function of single variable x
function f2 = f2(x) 
    x1 = 0 + x*0.5 ;
    x2 = 1 + x*1 ;
    f2 = ff(x1,x2) ;
end

%% the function of 2 variables
function ff = ff(x1,x2)
    ff = (3*x1+2*x2-1)^2 + (x1-x2+1)^2 ;
end

%% Dichotomous for f1
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

%% Dichotomous for f2
function min_dichotomous_single_f2 = dichotomous_single_f2(xmin,xmax)
r = 0.001 ;     %stop condition : minimal interval length
t = 100000 ;    %stop condition : calculation times


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

