function d = ModifiedNewton(J,r)
    epsilon=2e-6;
    H=J'*J;
    while true 
        c=cond(H);
        if(c>1e-10 && c<1e10&&(findProblem(H)==0))
            d=-H\J'*r;
            break;
        end
        H=H+epsilon*eye(size(H));
        epsilon=2*epsilon;
    end
end