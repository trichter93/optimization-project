phi=@(x,t) phi2(x,t);
[t,y]=data2;
start=[10;0;10;0];
tol=0.00001;
printout=1;
use_linesearch=0;
plotout=1;
x=gaussnewton(phi,t,y,start,tol,use_linesearch,printout,plotout);