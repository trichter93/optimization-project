function [l, value]= linesearch(multifunc,x,d)
phi = (sqrt(5) - 1)/2;
func=@(l) multifunc(x+d*l);
a = 0;
b = upper_limit(multifunc,x,d);

interval = [a b];

lambda = a + (1 - phi)*(b - a);
mu = a + phi*(b - a);

fl = func(lambda);
fm = func(mu);



for i = 1:100
    if fl >= fm
        a = lambda;
        interval = [a b];
        fl = fm;
        lambda = mu;
        mu = a + phi*(b - a);
        fm = func(mu);
    else
        b = mu;
        interval = [a b];
        fm = fl;
        mu = lambda;
        lambda = a + (1 - phi)*(b - a);
        fl = func(lambda);
    end
end

l = (interval(1) + interval(2))/2;
value=func(l);
end