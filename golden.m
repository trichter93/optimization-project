function [interval,min,minVal] = golden(init,func,steps)

phi = (sqrt(5) - 1)/2;

a = init(1);
b = init(2);

interval = [a b];

lambda = a + (1 - phi)*(b - a);
mu = a + phi*(b - a);

fl = func(lambda);
fm = func(mu);



for i = 1:steps
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

min = (interval(1) + interval(2))/2;
minVal = func(min);

end