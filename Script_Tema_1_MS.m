% Tema 1 
% Bogdan Alexnadru 332 AC 

Lp = 0.04; %m
S = 0.00007854; %m^2
ro = 1000; % kg/m^3
alfa = 0.127;
L = 0.08; %m
l = 0.14; %m
H = 0.25; %m
teta = pi/12; % grade
g = 9.8; %m/s^2
A2 = 0.021; %m^2
AT = 0.1273; %m^2
a1 = 4.2175 * 10^(-5); %m^2
a2 = 4.4842 * 10^(-5); %m^2
ac = 4.307 * 10^(-6); %m^2
Q_neg = 1.1667 * 10^(-4); %m^3/s
Qp1 = 0.5 * 10^(-4); %m^3/s
Qp2 = 0.5 * 10^(-4); %m^3/s
h0 = 0.17; %m
kp = 7*(10^(-3))/600; % L/(secunde*V)
Kev = 1;
Tev = 0.0125; %s


U=3:10;
u1=25/100;
u2=75/100;


 load_system('Pessi.slx');

 load_system('Tema1.slx');



Q=kp*U;
Qs=(u1/(u1+u2))*((u1/100)+(u2/100))*Q/2;
Qd=(u2/(u1+u2))*((u1/100)+(u2/100))*Q/2;
Qin1=Qs;
Qin2=Qd;

 % h1=max(out.h1_out); % peakurile graficului h1 pentru valorile de intrare U=3:10
 % h2=max(out.h2_out); % peakurile graficului h2 pentru valorile de intrare U=3:10
% [fitresult, gof] = createFit(U, h1)
% [fitresult, gof] = createFit1(U, h2)

%%
 
disp('Setul 1:');
[X1,U1,Y1] = trim('Pessi',[],3,[],[],1,[]);
[A_1,B_1,C_1,D_1]=linmod('Pessi',X1,U1,Y1);


disp('Setul 2:');
[X2,U2,Y2] = trim('Pessi',[],4,[],[],1,[]);
[A_2,B_2,C_2,D_2]=linmod('Pessi',X2,U2,Y2);


disp('Setul 3:');
[X3,U3,Y3] = trim('Pessi',[],5,[],[],1,[]);
[A_3,B_3,C_3,D_3]=linmod('Pessi',X3,U3,Y3);


disp('Setul 4:');
[X4,U4,Y4] = trim('Pessi',[],6,[],[],1,[]);
[A_4,B_4,C_4,D_4]=linmod('Pessi',X4,U4,Y4);


disp('Setul 5:');
[X5,U5,Y5] = trim('Pessi',[],7,[],[],1,[]);
[A_5,B_5,C_5,D_5]=linmod('Pessi',X5,U5,Y5);


disp('Setul 6:');
[X6,U6,Y6] = trim('Pessi',[],8,[],[],1,[]);
[A_6,B_6,C_6,D_6]=linmod('Pessi',X6,U6,Y6);

disp('Setul 8:');
[X8,U8,Y8] = trim('Pessi',[],10,[],[],1,[]);
[A_8,B_8,C_8,D_8]=linmod('Pessi',X8,U8,Y8);

disp('Setul 7:');
% [X7,U7,Y7] = trim('Pessi',[],9,[],[],1,[]);

X7=(X6+X8)/2;
U7=(U6+U8)/2;
Y7=(Y6+Y8)/2;

[A_7,B_7,C_7,D_7]=linmod('Pessi',X7,U7,Y7);

 load_system('StateSpaceToScopes.slx');

% tutorial run section cu variabilele
% schimbi portul de pe h2 pe h1
% comentezi state spaceurile pt h2 si decomentezi state spaceurile pt h1
% run Pessi ca sa ai porturile
% run first section
% run StateSpaceToScopes ca sa ai h2_lin
% run first section 

h1=[1.0150    1.0151    1.0153    1.0155    1.0156    1.0158    1.0159    1.0161];
% h2=[1.6332    1.6337    1.6341    1.6346    1.6351    1.6356    1.6360    1.6365];

h1_lin=[max(out.h1_lin1) max(out.h1_lin2) max(out.h1_lin3) max(out.h1_lin4) max(out.h1_lin5) max(out.h1_lin6) max(out.h1_lin7) max(out.h1_lin8)];

disp(h1_lin);
disp(h1);

eps1 = [ norm((h1_lin(1,1)-h1(1,1))/h1(1,1),2) norm((h1_lin(1,2)-h1(1,2))/h1(1,2),2) norm((h1_lin(1,3)-h1(1,3))/h1(1,3),2) norm((h1_lin(1,4)-h1(1,4))/h1(1,4),2) norm((h1_lin(1,5)-h1(1,5))/h1(1,5),2) norm((h1_lin(1,6)-h1(1,6))/h1(1,6),2) norm((h1_lin(1,7)-h1(1,7))/h1(1,7),2) norm((h1_lin(1,8)-h1(1,8))/h1(1,8),2) ];

disp(eps1);

% a  ramas portul de iesire pe h1 

 %%
disp('Setul 1:');
[Q1,W1,E1] = trim('Pessi',[],3,[],[],1,[]);
[F1,G1,H1,J1]=linmod('Pessi',Q1,W1,E1);


disp('Setul 2:');
[Q2,W2,E2] = trim('Pessi',[],4,[],[],1,[]);
[F2,G2,H2,J2]=linmod('Pessi',Q2,W2,E2);


disp('Setul 3:');
[Q3,W3,E3] = trim('Pessi',[],5,[],[],1,[]);
[F3,G3,H3,J3]=linmod('Pessi',Q3,W3,E3);


disp('Setul 4:');
[Q4,W4,E4] = trim('Pessi',[],6,[],[],1,[]);
[F4,G4,H4,J4]=linmod('Pessi',Q4,W4,E4);


disp('Setul 5:');
[Q5,W5,E5] = trim('Pessi',[],7,[],[],1,[]);
[F5,G5,H5,J5]=linmod('Pessi',Q5,W5,E5);


disp('Setul 6:');
[Q6,W6,E6] = trim('Pessi',[],8,[],[],1,[]);
[F6,G6,H6,J6]=linmod('Pessi',Q6,W6,E6);


disp('Setul 8:');
[Q8,W8,E8] = trim('Pessi',[],10,[],[],1,[]);
[F8,G8,H8,J8]=linmod('Pessi',Q8,W8,E8);

disp('Setul 7:');
% [Q7,W7,E7] = trim('Pessi',[],9,[],[],1,[]);

Q7=(Q6+Q8)/2;
W7=(W6+W8)/2;
E7=(E6+E8)/2;

[F7,G7,H7,J7]=linmod('Pessi',Q7,W7,E7); 


% am facut pt U=9 media de la U=8 si U=10 ca sa dea uniform , pt ca e
% retardat modulul si tot nu vrea sa dea , ori e valoarea prea mare/mica
% ori chiar e complexa si e nu vrea sa mearga 

 load_system('StateSpaceToScopes.slx');


% tutorial run section cu variabilele
% schimbi portul de pe h1 pe h2
% comentezi state spaceurile pt h1 si decomentezi state spaceurile pt h2
% run Pessi ca sa ai porturile
% run second section
% run StateSpaceToScopes ca sa ai h2_lin
% run second section 

% h1=[1.0150    1.0151    1.0153    1.0155    1.0156    1.0158    1.0159    1.0161];
h2=[1.6332    1.6337    1.6341    1.6346    1.6351    1.6356    1.6360    1.6365];

h2_lin=[max(out.h2_lin1) max(out.h2_lin2) max(out.h2_lin3) max(out.h2_lin4) max(out.h2_lin5) max(out.h2_lin6) max(out.h2_lin7) max(out.h2_lin8)];

disp(h2_lin);
disp(h2);

eps2 = [ norm((h2_lin(1,1)-h2(1,1))/h2(1,1),2) norm((h2_lin(1,2)-h2(1,2))/h2(1,2),2) norm((h2_lin(1,3)-h2(1,3))/h2(1,3),2) norm((h2_lin(1,4)-h2(1,4))/h2(1,4),2) norm((h2_lin(1,5)-h2(1,5))/h2(1,5),2) norm((h2_lin(1,6)-h2(1,6))/h2(1,6),2) norm((h2_lin(1,7)-h2(1,7))/h2(1,7),2) norm((h2_lin(1,8)-h2(1,8))/h2(1,8),2) ];

disp(eps2);

%%

u_nou= linspace(3,10,8);

eroare_1 = zeros(1,8);
eroare_2 = zeros(1,8);
eroare_3 = zeros(1,8);

h1_lin=h1_lin*1000;
for i = 1:8
    eroare_1(i) = abs((h1_lin(i)-h1(2))/h1(2));
     eroare_2(i) = abs((h1_lin(i)-h1(3))/h1(3));
      eroare_3(i) = abs((h1_lin(i)-h1(4))/h1(4));
end








