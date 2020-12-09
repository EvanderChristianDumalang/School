clc

fprintf('-----------------------------------------------------------------------------------------------------------------\n')
    xi = 0;
    xu = 1.5;
    es = 0.01;
    ea = 0;
    f = @(x)(3*x)+sin(x)-exp(x);
    i = 1;
    b1 = [];
    b2 = [];
    b3 = [];
    fprintf ('Bisection Method\n');
    while (true)
        xr = (xi + xu)/2;
        if f(xi) * f(xr) < 0 
            xu = xr;
            ea = abs((xr-xi)/xr)*100;
        else
            xi = xr;
            ea = abs((xr-xu)/xr)*100;
        endif
        if i == 1 
            ea = 100;
        endif
        fprintf('Iterasi-%d, xi = %0.4f, xu = %0.4f, xr = %0.4f, f(xi) = %0.4f, f(xu) = %0.4f, f(xr) = %0.4f, ea =%0.4f\n' ,i, xi, xu, xr, f(xi), f(xu), f(xr), ea);
        b1 = [b1, xr];
        b2 = [b2, ea];
        b3 = [b3, i];
        i+=1;
        if ea < es
            break;
        endif
        
    endwhile

fprintf('-----------------------------------------------------------------------------------------------------------------\n')

    xi = 0;
    xu = 1.5;
    es = 0.01;
    ea = 0;
    f = @(x)(3*x)+sin(x)-exp(x);
    i = 1;
    r1 = [];
    r2 = [];
    r3 = [];
    fprintf ('RegulaFalsi Method\n');
    while (true)
        xr = xu-((f(xu))*(xi-xu))/((f(xi))-(f(xu)));
        if i == 1 
            ea = 100;
        else 
            ea = abs((xr-xu)/xr)*100;
        endif
        if f(xi) * f(xr) < 0 
            xu = xr;
        else
            xi = xr;
        endif
        
        fprintf('Iterasi-%d, xi = %0.4f, xu = %0.4f, xr = %0.4f, f(xi) = %0.4f, f(xu) = %0.4f, f(xr) = %0.4f, ea =%0.4f\n' ,i, xi, xu, xr, f(xi), f(xu), f(xr), ea);
        r1 = [r1, xr];
        r2 = [r2, ea];
        r3 = [r3, i];
        i+=1;
        if ea < es
            break;
        endif
    endwhile


fprintf('-----------------------------------------------------------------------------------------------------------------\n')

    xi = 0;
    es = 0.01;
    ea = 0;
    f = @(x)(3*x)+sin(x)-exp(x);
    g = @(x)(3)+cos(x)-exp(x);
    i = 1;
    n1 = [];
    n2 = [];
    n3 = [];
    fprintf ('Newton Rhapson Method\n');
    while (true)
        xnew = xi - f(xi)/g(xi);
        if i == 1 
            ea = 100;
        else 
            ea = abs((xnew-xi)/xnew)*100;
        endif
        fprintf('Iterasi-%d, xi = %0.4f, xnew = %0.4f, f(xi) = %0.4f, f(xnew) = %0.4f, ea =%0.4f\n' ,i, xi, xnew, f(xi), f(xnew), ea);
        xi = xnew;
        n1 = [n1, xnew];
        n2 = [n2, ea];
        n3 = [n3, i];
        i+=1;
        if ea < es
            break;
        endif
    endwhile

fprintf('-----------------------------------------------------------------------------------------------------------------\n')

    xi = 0;
    xu = 0.2;
    es = 0.01;
    ea = 0;
    f = @(x)(3*x)+sin(x)-exp(x);
    i = 1;
    s1 = [];
    s2 = [];
    s3 = [];
    fprintf ('Secant Method\n');
    while (true)
        xr = xu-((f(xu))*(xu-xi))/((f(xu))-(f(xi)));
        if i == 1 
            ea = 100;
        else 
            ea = abs((xr-xu)/xr)*100;
        endif
        fprintf('Iterasi-%d, xi = %0.4f, xu = %0.4f, xr = %0.4f, f(xi) = %0.4f, f(xu) = %0.4f, f(xr) = %0.4f, ea =%0.4f\n' ,i, xi, xu, xr, f(xi), f(xu), f(xr), ea);
        xi = xu;
        xu = xr;
        s1 = [s1, xr];
        s2 = [s2, ea];
        s3 = [s3, i];
        i+=1;
        if ea < es
            break;
        endif
    endwhile

fprintf('-----------------------------------------------------------------------------------------------------------------\n')
subplot(2,1,1)
plot (b3,b1,"bo--", r3,r1,"mo--", n3,n1,"go--", s3,s1,"ro--")
xlabel('Iterasi')
ylabel('Akar')
title('Akar Persamaan')
legend('Bisection', 'RegulaFalsi', 'Newton Rhapson', 'Secant')
subplot(2,1,2)
plot (b3,b2,"bo--", r3,r2,"mo--", n3,n2,"go--", s3,s2,"ro--")
xlabel('Iterasi')
ylabel('Error (%)')
title('Akar Persamaan')
legend('Bisection', 'RegulaFalsi', 'Newton Rhapson', 'Secant')
waitfor(figure(1))
