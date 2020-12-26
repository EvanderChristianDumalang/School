function [a, b, c] = Trapezoid(x0, xn, n, err)
    condition = true;
    f = @(x)0.5*exp(3/2*x+1)-3*sqrt(x);
    a = [];
    b = [];
    c = [];
    while (condition)
        integral = 0;
        eksak = 0;
        h = 0;
        k = 0;

        h = (xn - x0) / n;
        integral = f(x0) + f(xn);

        for i = 1:n-1
            k = x0 + i*h;
            integral = integral + 2 * f(k);
        end

        integral = integral * h/2;
        eksak = abs((11.331434984073670335646966123022139072418212890625-integral)/11.331434984073670335646966123022139072418212890625)*100;
        a(end+1) = integral;
        b(end+1) = eksak;
        c(end+1) = n;
        n+=1;
        if eksak<err
            condition = false;
        else
            condition = true;
        end    
        
    end
end
