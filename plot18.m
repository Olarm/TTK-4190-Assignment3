step = zeros(10000,1);
step(1:3000) = 4*ones(3000,1) ;
step(3001:10001) = 7*ones(7001,1);

plot(t, v(:,1), "blue", t, step, "--")