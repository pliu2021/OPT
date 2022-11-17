clear all
close all


x0 = [2 3] ;
d = [1 2] ;
x1 = x0 + 10*d ;
X = [x0;x1] ;
%1
plot(X(:,1),X(:,2),'LineWidth',1.5)
hold on
%2
plot(x0(1),x0(2),'*','LineWidth',1.5)
rectangle('Position',[0 0 25 25])
%3
a = [0:1:10] ;
for i = 1:size(a,2)
    M = x0 +a(i)*d ;
    plot(M(1),M(2),'b*')
end