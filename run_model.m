clear all;
close all;

%parametry zbiornikow
a = 31;
b = 46.5;
c = 10;
R = 39;
w = 5;
Hmax = 40;

%parametry przeplywow
%max
qmax = 133.63;%równy przep³yw 107.48;
C1max = 36.9;
C2max = 33.91;
C3max = 36;

%stopnie otwarcia zaworow (0,1)
gq = 1;
gC1 = 1;
gC2 = 1;
gC3 = 1;

%stany poczatkowe
H10 = 11.9703;%31.75;
H20 = 15;%36.18;
H30 = 12.5763;%35.91; %initial wiêkszy od zera

%stopnie pierwiastkow
p1 = 0.41;
p2 = 0.46;
p3 = 0.37;

%offset
D1 = 3.5673;
D2 = 2.8498;
D3 = 2.882;

%parametry solvera
T = 1000;
step = 0.1;

sim('model_zb');


figure
subplot(3,2,1)
plot(t,H1)
grid on
ylabel('H1')
axis([0 T 0 Hmax])

subplot(3,2,3)
plot(t,H2)
grid on
ylabel('H2')
axis([0 T 0 Hmax])

subplot(3,2,5)
plot(t,H3)
grid on
ylabel('H3')
xlabel('t')
axis([0 T 0 Hmax])

subplot(3,2,2)
plot(t,B1)
grid on
ylabel('B1')
%axis([0 T 0 100])

subplot(3,2,4)
plot(t,B2)
grid on
ylabel('B2')
%axis([0 T 0 Hmax])

subplot(3,2,6)
plot(t,B3)
grid on
ylabel('B3')
xlabel('t')
%axis([0 T 0 Hmax])