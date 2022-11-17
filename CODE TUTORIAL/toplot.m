function toplot(m,n)
plotsin(m)
plotcos(n)
end

function plotsin(m)
x = 0:0.02:m ;
plot (x,sin(x))
hold on
end

function plotcos(n)
x = 0:0.02:n ;
plot (x,cos(x))
hold on
end