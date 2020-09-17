syms x
syms t



z=1./((3*10).^(1/3));
z1=1./((3*20).^(1/3));
z2=1./((3*5).^(1/3));
fplot(z*airy((x-10)*z), [-60 60])


grid on
hold on

fplot(z1*airy((x-20)*z1), [-60 60])



grid on


fplot(z2*airy((x-5)*z2), [-20 20])
title('Plot of Solution U(x,t)')
xlabel('x')
ylabel('U(x,t)')
grid on
legend('t=10','t=20', 't=30','Location','Best')
