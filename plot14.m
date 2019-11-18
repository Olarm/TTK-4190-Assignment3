%function plot14(t, r, r_d, psi, psi_d)

figure(1)
plot(t, psi, "blue", t, psi_d)

figure(2)
subplot(2,1,1)
plot(t, r, "blue", t, r_d)
legend("r", "r_d")

subplot(2,1,2)
plot(t, n)