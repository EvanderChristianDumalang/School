function [xx, yy, zz]= Simpson(x0, xn, n, err)
    eksak = 100;
    xx = [];
    yy = [];
    temp = 2;
    zz = [];
    while (err<eksak)
        A1 = 0;
        eksak = 0;
        n = temp;
        zz(end+1) = n;

        while(n~=0)
            if mod(n,2) == 0 
                A1 = Simpson13(x0, xn, n);
                eksak = eksak + abs((11.331434984073670335646966123022139072418212890625-A1)/11.331434984073670335646966123022139072418212890625)*100;
                n=mod(n,2);
            else
                A1 = Simpson38(x0, xn, n);
                eksak = eksak + abs((11.331434984073670335646966123022139072418212890625-A1)/11.331434984073670335646966123022139072418212890625)*100;
                n = n - 3;
            end
        end
    xx(end+1) = A1;
    temp=temp+1;
    yy(end+1) = eksak;
    end
end

function integral = Simpson13(x0,xn,n)
    f = @(x)0.5*exp(1.5*x+1)-3*sqrt(x);
    h = (xn - x0) / n;

    integral = f(x0) + f(xn);
    
    for i = 1:n-1
        k = x0 + i*h;
        if mod(i,2) == 0
            integral = integral + 2 * f(k);
        else
            integral = integral + 4 * f(k);
        end
    end
    integral = integral * h / 3;
end

function integral = Simpson38(x0,xn,n)
    f = @(x)0.5*exp(1.5*x+1)-3*sqrt(x);
    h = (xn - x0) / n;

    integral = f(x0) + f(xn);

    for i = 1:n-1
        k = x0 + i*h;
        integral= integral + 3 * f(k);
    end
    integral = integral * 3 * h / 8;
end