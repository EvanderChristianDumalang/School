function IntegralTrapezoid = Trapezoid(x0, xn, n)
    f = @(x)0.5*exp(3/2*x+1)-3*sqrt(x);
    h = (xn - x0) / n;
    integral = f(x0) + f(xn);

    for i = 1:n-1
        k = x0 + i*h;
        integral = integral + 2 * f(k);
    end

    integral = integral * h/2;
    eksak = abs((11.3314-integral)/11.3314)*100;
    printf('Hasil Intergal Ganda adalah %.3f.\n' ,integral);
    printf('Hasil Analisis Kesalahan adalah %.3f.\n' ,eksak);
    
end
