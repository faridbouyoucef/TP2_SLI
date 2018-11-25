% Script TP MOTEUR

clear all
close all

% Période d'échantillonnage
Te = 0.01;

% Modèle du moteur :
Ke = 3.6/1000*60/(2*pi);

Km=7;
Tm=0.3;
Kc=3.5/100;
Kg = 0.105;
Ks=10;
%R=6.2;
%L=0.8e-3;
%J1=0.039e-4;
%TauM1=19.6e-3;

%TauM2=500e-3;
%mu=J1/TauM1;
%J2=Taum2*mu;
%TF=tf(Kc,[L*J2 mu*L+R*J2 Ke*Kc+mu*R]);

A=[0 Ks/(9*Kg);0 (-1/Tm)];
B=[0; (Km*Kg)/Tm];
C=[1 0];
D=[0];

sys=ss(A,B,C,D);
Vp=eig(A);

Co=ctrb(sys);
rang_co=rank(Co);

Obs=obsv(sys);
rang_obs=rank(Obs);

%%%%%%%%%%%partie 3.1*******
K=acker(A,B,[-2.4+5.5*i -2.4-5.5*i])

%%%%% d'ou: K =[1.3890    0.5986]
K1=1.3890;
K2=0.5986;
Abf=[0 Ks/(9*Kg); -((Kg*Km)/Tm)*K1 -((Kg*Km)/Tm)*K2-(1/Tm)];
Bbf=[0; (Km*Kg)/Tm];
Cbf=[1 0];
Dbf=[0];

sys=ss(Abf,Bbf,Cbf,Dbf)
Vp1=eig(Abf)
%%%%%%% on calcule les valeur propre de la nouvelle matrice et si ils sont
%%%%%%% egale aux pole désiré donc on est bien 
%Vp1 = -2.4000 + 5.5001i
 %    -2.4000 - 5.5001i


%%%%%%%% partie 3.2************









