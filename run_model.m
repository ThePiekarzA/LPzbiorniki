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
qmax = 40;
C1max = 36.9;
C2max = 33.91;
C3max = 36;

%stopnie otwarcia zaworow (0,1)
gq = 1;
gC1 = 1;
gC2 = 1;
gC3 = 0;

%stany poczatkowe
H10 = 0;%31.75;
H20 = 0;%36.18;
H30 = 0;%35.91;

%stopnie pierwiastkow
p1 = 0.41;
p2 = 0.46;
p3 = 0.37;

%parametry solvera
T = 100;
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