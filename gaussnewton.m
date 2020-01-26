function x=gaussnewton(phi,t,y,start,tol,use_linesearch,printout,plotout)
    x=start;
    Phi=phi(x,t);
    f=@(x1) (phi(x1,t)-y)'*(phi(x1,t)-y);
    r=Phi-y;
    sum=r'*r;
    lambda=1;
    count=0;
    if printout
        fprintf('iter \t   x \t  step size \t    f(x)     max(abs(r))   norm(grad) \t ls iters      lambda      grad*d/norm(d) \n');
    end
    while(true)
        count=count+1;
        
        
        J=jacobian(x,t);
        d=ModifiedNewton(J,r);
%         if(flag~=0)
%             d=-eye(n)/epsilon;
%         else
%             d=-(J'*J)\J'*r;
%         end
        
        if(use_linesearch)
            [lambda, Nr_of_Iterations]=linesearch(f,x,d);
        else
            Nr_of_Iterations=0;
        end
        x=x+lambda*d;
        Phi=phi(x,t);
        r=Phi-y;
        sum=r'*r;
        if(printout)
             i = 1;
            StepSize = norm(lambda*d);
            gradd = (2*J'*r)'*d/norm(d);
            grad_f=2*J'*r;
            s = sprintf('\n%3d %11.4f %12.4g %12.4f %12.4g %12.4f %12d %12.4f    %12.4f', count, x(i), StepSize, sum, max(abs(r)),norm(grad_f), Nr_of_Iterations, lambda, gradd);
            i = 2;
            while i <= length(x)
                s = sprintf('%s\n    %11.4f', s, x(i));
                i = i+1;
            end
            disp(s);
            
        end
      
        if abs(lambda*d)<tol
            break;
        end
        
        
        
    end
    if(plotout)
           plot(t,y,'.');
           hold on;
           tnew=linspace(t(1),t(end),1000);
           plot(tnew,phi(x,tnew));
           if(length(x)==2)
               legend('data points', '\phi_{1}(x,t)');
           else
               legend('data points', '\phi_{2}(x,t)');
           end
            
    end
end

