clear all
close all

%parametry zbiornikow
a = 31;
b = 46.5;
c = 10;
R = 39;
w = 5;
Hmax = 40;

%pkt równowagi
%H1 = ?
%H2 = r
%H3 = ?
r = 15;

%parametry przeplywow
C1 = 36.9;
C2 = 33.91;
C3 = 36;

%offset
D1 = 3.5673;
D2 = 2.8498;
D3 = 2.882;

%stany poczatkowe
H10 = 11.9703;%31.75;
H20 = 15;%36.18;
H30 = 12.5763;%35.91; %initial wiêkszy od zera

%stopnie pierwiastkow
p1 = 0.41;
p2 = 0.46;
p3 = 0.37;

%parametry przeplywow
C1max = 36.9;
C2max = 33.91;
C3max = 36;

%stopnie otwarcia zaworow (0,1)
gC1 = 1;
gC2 = 1;
gC3 = 1;

H1OUT = ((C2*(r+D2)^p2)/C1)^2;
H2OUT = r;
H3OUT = ((C2*(r+D2)^p2)/C3)^2;
qIN = C1*(H1OUT+D1)^p1;

%dl=1;


[A,B,C,D] = linmod('model_zbINOUT',[H1OUT,H2OUT,H3OUT],qIN);
Q=zeros(3);
Q(1,1)=1;
Q(2,2)=1000;
Q(3,3)=1;
R=20; 
[K,D,E]=lqr(A,B,Q,R);


