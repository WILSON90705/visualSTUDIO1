
clc
clear
close all

%Sistema
A = [-2 -1;1 0];
b = [1; 0];
c = [0 1];
sys = ss(A,b,c,0);

%Matriz F Estable
F = roots([1 10]); %Autovalor desead (s+10)

%Vector l arbitrario
l=1;

%(F,l) debe ser controlable
Co = ctrb(F,l)

%Se obtiene la solución de T (ecuación de sylvester)
T = sylvester(-F,A,l*c);

%Matriz de Transformación
P = inv([c;T])



