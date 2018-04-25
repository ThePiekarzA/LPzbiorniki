clearvars;
%close all;
clc

load('swobodny_wyplyw_h2')

figure
plot(h2(:,1), h2(:,2));
grid on;
title('Swobodny wyplyw - zbiornik 2');
global h2_;
global H2_estymowane;
h2_ = h2(350:4800,:);
plot(h2_(:,1),h2_(:,2));
xlabel('time [s]'); ylabel('H2 [cm]'); title('zbiornik srodkowy - opró¿nianie bez dop³ywu'); grid on;

% 20 < C1 < 30
% -2 < D1 < 2
% 0 < p1 < 1

%dopasowanie prostej do pierwszych 500 probek w celu wyznaczenia C1
p = 5*31*polyfit(h2_(1:500,1),h2_(1:500,2),1);
C2_0 = -p(1)/sqrt(mean(h2_(1:500,2)));
C2_0 = 24;
delta_C2_0 = 10;
D2_0 = 0;
delta_D2_0 = 5;
p2_0 = 0.5;
h2_0 = mean(h2_(1:5,2));
delta_h2_0 = 2;


% initial(1) = C2
% initial(2) = D2
% initial(3) = p2
% initial(4) = h2_0

A = [1,0,0,0; -1,0,0,0; 0,1,0,0; 0,-1,0,0; 0,0,1,0; 0,0,-1,0; 0,0,0,1; 0,0,0,-1];
b = [(C2_0+delta_C2_0); (C2_0-delta_C2_0); (D2_0+delta_D2_0); (-D2_0+delta_D2_0); 1; 0; (h2_0+delta_h2_0); (h2_0-delta_h2_0)];

initial = [C2_0; D2_0; p2_0; h2_0]; 

w2 = fmincon(@fun_h2, initial, A, b);

hold on;
plot(h2_(:,1), H2_estymowane);
grid;
hold off;