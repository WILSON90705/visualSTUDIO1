syms s
s=tf('s');
OP=(200*s+2000)/((s+1)*(s+3)*(s^2+12*s+72))
t=0:1e-3:15;
[y]=step(OP,t);
plot(t',y)
QQX=iddata(y,ones(length(t),1));
G=procest(QQX,'P1D')
compare(QQX,OP)
Td=OP.Td;
Kp=OP.Kp;
tao=OP.Tp1;
%CONTROL P DEL SISTEMA
Gc1=tao/(Kp*Td);
tk=feedback(OP,1);
Tc1=feedback(OP*Gc1,1);
step(tk,Tc1)
%CONTROL PI DEL SISTEMA
KP=Gc1*.9;
Ti=3.333*Td;
Gc2=KP*(1+1/(Ti*s));
Tc2=feedback(OP*Gc2,1);
step(tk,Tc2)
%CONTROL PID
KP=(1.2*Gc1)*.5;
Ti=2*Td;
TD=.5*Td;
Td1=TD/10;
Ki=KP/Ti;
Kd=KP/TD;
Gc3=KP*(1+1/(Ti*s)+(Td1*s)/(Td1*s+1));
Tc3=feedback(Gc3,1)