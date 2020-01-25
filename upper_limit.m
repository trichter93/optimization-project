function b = upper_limit(multifunc,x,d)
    func=@(l) multifunc(x+l*d);
    lambda=1;
    margin=func(0)*1e-12+1e-12;
    while(isfinite(func(lambda))==0)
            lambda=lambda*0.9;
    end
    if func(0)+margin>func(lambda) 
        lambda=2*lambda;
        while(func(0)+margin>func(lambda) && (isfinite(func(lambda))))
            lambda=2*lambda;
        end
        
        
    elseif func(0)+margin <func(lambda)
        lambda=lambda/2;
        while(func(0)+margin<func(lambda)&& isfinite(func(lambda))) 
            lambda=lambda/2;
        end
        lambda=lambda*2;
    end
    b=lambda;
end