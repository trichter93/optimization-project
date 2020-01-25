function x=gaussnewton(phi,t,y,start,tol,use_linesearch,printout,plotout)
    x=start;
    Phi=phi(x,t);
    f=@(x1) (phi(x1,t)-y)'*(phi(x1,t)-y);
    r=Phi-y;
    sum=r'*r;
    lambda=1;
    while(sum>tol)
        if(printout)
            
            
        end
        if(plotout)
            
            
        end
        J=jacobian(x,t);
        d=-(J'*J)\J'*r;
        if(use_linesearch)
            lambda=linesearch(f,x,d);
            
        end
        x=x+lambda*d;
        Phi=phi(x,t);
        r=Phi-y;
        sum=r'*r;
    end
end