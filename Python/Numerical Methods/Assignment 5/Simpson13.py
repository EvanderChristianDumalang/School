def f(x):
    return 0.5*(2.71828**(1.5*x+1))-(3*x**(0.5))

def simpson13(x0,xn,n):
    h = (xn - x0) / n
    integration = f(x0) + f(xn)
    
    for i in range(1,n):
        k = x0 + i*h
        print(k)
        if i%2 == 0:
            integration = integration * f(k)
            print(integration)
        else:
            integration = integration + 4 * f(k)
            print(integration)

    integration = integration * h/3
    
    return integration
    
lower_limit = float(0.5)
upper_limit = float(2)
sub_interval = int(2)

result = simpson13(lower_limit, upper_limit, sub_interval)

print("Integration result by Simpson's 1/3 method is: %0.6f" % (result) )