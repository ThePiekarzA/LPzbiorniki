clearvars;
%close all;
clc

load('swobodny_wyplyw_h1')

figure
plot(h1(:,1), h1(:,2));
grid on;
title('Swobodny wyplyw - zbiornik 1');
global h1_;
global H1_estymowane;
h1_ = h1(330:4698,:);
plot(h1_(:,1),h1_(:,2));
xlabel('time [s]'); ylabel('H1 [cm]'); title('zbiornik górny - opró¿nianie bez dop³ywu'); grid on;

% 20 < C1 < 30
% -2 < D1 < 2
% 0 < p1 < 1

%dopasowanie prostej do pierwszych 500 probek w celu wyznaczenia C1
p = 5*31*polyfit(h1_(1:500,1),h1_(1:500,2),1);
C1_0 = -p(1)/sqrt(mean(h1_(1:500,2)));
delta_C1_0 = 10;
D1_0 = 0;
delta_D1_0 = 5;
p1_0 = 0.5;
H1_0 = mean(h1_(1:5,2));
delta_H1_0 = 2;


% initial(1) = C1
% initial(2) = D1
% initial(3) = p1
% initial(4) = H1_0

A = [1,0,0,0; -1,0,0,0; 0,1,0,0; 0,-1,0,0; 0,0,1,0; 0,0,-1,0; 0,0,0,1; 0,0,0,-1];
b = [(C1_0+delta_C1_0); (C1_0-delta_C1_0); (D1_0+delta_D1_0); (-D1_0+delta_D1_0); 1; 0; (H1_0+delta_H1_0); (H1_0-delta_H1_0)];

initial = [C1_0; D1_0; p1_0; H1_0]; 

w1 = fmincon(@fun_h1, initial, A, b);

a = 31;
szer = 5;

hold on;
plot(h1_(:,1), H1_estymowane);
grid on;
hold off;