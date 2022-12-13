%% Slip-friction curves for different road conditions.
close all; clear; clc;
%% A, B, C, D are empirical coefficients
%
A = [1.2801, 0.857, 1.1973, 1.3713, 0.4004, 0.1946, 0.05];
B = [23.99, 33.822, 25.168, 6.4565, 33.708, 94.129, 306.39];
C = [0.523, 0.347, 0.5373, 0.6691, 0.1204, 0.0646, 0];
D = [0.03, 0.03, 0.03, 0.03, 0.03, 0.03, 0.03];
%% Slip
%
slip_x = 0:0.01:1;
colors = ["r","g","b","k","c","m","y"];
v=30;   % velocity = 30 m/s
miu_y(7,100)=0;
%% Calculation of Friction coefficients
for i=1:length(A)
    for j=1:length(slip_x)
        miu_y(i,j) = (A(i)*(1-exp(-B(i)*slip_x(j)))-C(i)*slip_x(j))*exp(-D(i)*slip_x(j)*v);
    end
    figure(1)
    plot(slip_x,miu_y(i,:),colors(i))
    hold on
end
%% Plot the Friction coefficients vs Wheel slip
%
xlabel("Wheel slip","FontSize",10)
ylabel("Friction coefficients","FontSize",10)
grid on;
title("Friction coefficients vs Wheel slip","FontSize",10)
legend("Asphalt, dry", "Asphalt, wet", "Concrete, dry", "Cobblestones, dry", "Cobblestones, wet", "Snow", "Ice")
