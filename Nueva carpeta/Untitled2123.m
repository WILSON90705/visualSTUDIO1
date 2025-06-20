%%example
G=zpk([],[-1 -1 -1],1);
%verificamos la forma 
%de la repsuesta step
step(G)
%se define el vector de tiempo segun la grafica
t=0:0.01:15;
[y]=step(G,t);
plot(t',y)
QX=iddata(y,ones(length(t),1),1e-3);
G1=procest(QX,'P1D')
compare(QX,G1)
Td=G1.Td;
Kp=G1.Kp;
tao=G1.Tp1;
s=tf('s');
%controlador P
Gc1=tao/(Kp*Td);
tk=feedback(G1,1);
Tc1=feedback(G1*Gc1,1);
step(tk,Tc1)
%controlador PI
KP=Gc1*.9;
Ti=3.333*Td;
Gc2=KP*(1+1/(Ti*s));
Tc2=feedback(G1*Gc2,1);
step(tk,Tc2)
%controlador PID
KP=(1.2*Gc1)*.5;
Ti=2*Td;
TD=.5*Td;
Td1=TD/10;
Ki=KP/Ti;
Kd=KP/TD;
Gc3=KP*(1+1/(Ti*s)+(Td1*s)/(Td1*s+1));
Tc3=feedback(G1*Gc3,1);