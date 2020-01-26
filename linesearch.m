function [lambda, Nr_of_Iterations]= linesearch(multifunc,x,d)
phi = (sqrt(5) - 1)/2;
func=@(l) multifunc(x+d*l);
a = 0;
b = upper_limit(multifunc,x,d);

interval = [a b];
tol=1e-6;
lambda = a + (1 - phi)*(b - a);
mu = a + phi*(b - a);

fl = func(lambda);
fm = func(mu);

startInt=b-a;
count=0;
while true
    count=count+1;
    Int=b-a;
    if(Int/startInt<tol)
        break;
    end
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
lambda = (interval(1) + interval(2))/2;
Nr_of_Iterations=count;
end