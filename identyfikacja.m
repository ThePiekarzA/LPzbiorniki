clear all;
close all;
%C1s = -p(1)/sqrt(mean(h1_(1:500,2)))
H = [0 5 10 15 20 25 30 35];
H0 = H(2:end);
Z1 = [0 0.37 0.7 1.03 1.34 1.67 1.98 2.3];
Z10 = Z1(2:end);
Z2 = [0 0.4 0.73 1.05 1.37 1.7 2.01 2.33];
Z20 = Z2(2:end);
Z3 = [1 1.2 1.42 1.63 1.83 2.04 2.23 2.43];

figure(1)
plot(Z10, H0, '+-r')
hold on
plot(Z20, H0, '+-g')
plot(Z3, H, '+-b')

title('Identyfikacja czujników poziomu cieczy zbiorników')
xlabel('Poziom cieczy [cm]')
ylabel('Napiêcie [V]')
legend('Zbiornik1', 'Zbiornik2', 'Zbiornik3', 'location', 'southeast')
grid

wsp1 = polyfit(Z10, H0, 1);
wsp2 = polyfit(Z20, H0, 1);
wsp3 = polyfit(Z3, H, 1);