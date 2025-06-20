s=tf('s');
G=zpk([],[-1 -1 -1],1);
[Mgc Mfc Wgc Wfc]=margin(G);
ED=feedback(G*8,1);
step(ED)
%calculamos el periodo critico 
Kcr=8;
Pcr=85.6-81.9;
Wcr=2*pi/Pcr;
%diseñamos el controlador 
%controlador Proporcional
GcP=0.5*Kcr;
TC1=feedback(GcP*G,1)
%controlador PI
Kp=.45*Kcr;
Ti=Pcr/1.2;
GcPI=Kp*(1+1/(Ti*s));
TC2=feedback(GcPI*G,1)
%controlador PID
Kp=.6*Kcr;
Ti=.5*Pcr;
Td=Pcr/8;
GcPID=pid(Kp,Ti,Td)
TC3=feedback(GcPID*G,1);
step(TC3)