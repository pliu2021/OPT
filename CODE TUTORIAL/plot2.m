clear all
x = [1 2 3 5 7 9 7 4.5];
y = [5 8 6 9 7 9 2 2] ;
plot(x,y)
rectangle('Position',[0,0,10,10])
hold on
rng(1)
M = 10 * rand(10,2) ;
plot(M(:,1),M(:,2),LineWidth=1.5)