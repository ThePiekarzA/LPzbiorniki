clearvars;
%close all;
clc

load('swobodny_wyplyw_h3')

figure
plot(h3(:,1), h3(:,2));
grid on;
title('Swobodny wyplyw - zbiornik 3');
global h3_;
global H3_estymowane;
h3_ = h3(300:5200,:);
plot(h3_(:,1),h3_(:,2));
xlabel('time [s]'); ylabel('H3 [cm]'); title('zbiornik dolny - opró¿nianie bez dop³ywu'); grid on;

% 20 < C1 < 30
% -2 < D1 < 2
% 0 < p1 < 1

%dopasowanie prostej do pierwszych 500 probek w celu wyznaczenia C1
p = 5*31*polyfit(h3_(1:500,1),h3_(1:500,2),1);
C3_0 = -p(1)/sqrt(mean(h3_(1:500,2)));
C3_0 = 26;
delta_C3_0 = 10;
D3_0 = 0;
delta_D3_0 = 5;
p3_0 = 0.5;
h3_0 = mean(h3_(1:5,2));
delta_h3_0 = 2;


% initial(1) = C3
% initial(2) = D3
% initial(3) = p3
% initial(4) = h3_0

A = [1,0,0,0; -1,0,0,0; 0,1,0,0; 0,-1,0,0; 0,0,1,0; 0,0,-1,0; 0,0,0,1; 0,0,0,-1];
b = [(C3_0+delta_C3_0); (C3_0-delta_C3_0); (D3_0+delta_D3_0); (-D3_0+delta_D3_0); 1; 0; (h3_0+delta_h3_0); (h3_0-delta_h3_0)];

initial = [C3_0; D3_0; p3_0; h3_0]; 

w3 = fmincon(@fun_h3, initial, A, b);

hold on;
plot(h3_(:,1), H3_estymowane);
grid;
hold off;