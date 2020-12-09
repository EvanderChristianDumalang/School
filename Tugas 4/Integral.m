clear;
clc;

fprintf('-------------------------------------------\n')
a = 0.5;
b = 2;
n = 1;
err = 0.0001;

[x, y, z] = Trapezium(a, b, n, err);
[xx, yy, zz] = Simpson(a, b, n, err);

subplot(2,1,1);
plot(z,x,'bo--',zz,xx,'go--');
xlabel('Segmen');
ylabel('Integral');
title('Differences');
legend('Trapezoid','Simpson');
subplot(2,1,2);
plot(z,y,'bo--',zz,yy,'go--');
xlabel('Segment');
ylabel('Error');
title('Differences');
legend('Trapezoid','Simpson');
fprintf('-------------------------------------------')
