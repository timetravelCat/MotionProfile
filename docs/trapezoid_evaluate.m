function trapezoid_evaluate(trapezoid, n)
% plot trapezoid, print info
size = 1000;
t = linspace(0, trapezoid.t, size);
pos = zeros(size);
vel = zeros(size);
for i = 1:size
    [pos(i), vel(i)] = trapezoid_at(trapezoid, t(i));
end
figure(1)
subplot(4,3,n);
hold on
grid on
plot(t, pos);
plot(t, vel);
legend('pos', 'vel')
end