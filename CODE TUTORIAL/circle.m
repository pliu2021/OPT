clear all
close all

c = [5 5] ;
r = 5 ;
a = [0 : 10 * 2*pi/360 : 2*pi] ;
plot(c(1),c(2),'*','LineWidth',3)
rectangle('Position',[0 0 10 10])
hold on
for i = 1 : size(a,2)
    x = c(1) + r*cos(a(i)) ;
    y = c(2) + r*sin(a(i)) ;
    plot(x,y,'*','LineWidth',2)
    Line = [c;[x y]] ;
    plot(Line(:,1),Line(:,2))
end
