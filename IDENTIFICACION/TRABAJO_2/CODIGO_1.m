syms s
s=tf('s');
G2=tf(P2DZU)
Ye=lsim(G2,u,w);
plot(t,Ye,'--',t,w,t,Ye,'-.','linewidth',2);legend('REFERENCIA','Real','ESTIMADA')