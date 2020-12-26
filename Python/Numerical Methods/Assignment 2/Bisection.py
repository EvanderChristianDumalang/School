import math
import matplotlib.pyplot as plt
from __future__ import division

def f(x):
    return ((0.5)*x*2.71828**x**(0.5))-2

def biseksi(xi,xu,es,ea):
    i = 1
    condition = True

    while condition:
        xr = (xi + xu)/2
        print('Iterasi-%d, xi = %0.6f, xu = %0.6f, xr = %0.6f,  ea =' % (i, xi, xu, xr), end=" ")
      
        if f(xi) * f(xr) < 0 :
            xu = xr
            ea = abs((xr-xi)/xr)*100
        else:
            xi = xr
            ea = abs((xr-xu)/xr)*100
        if i == 1 :
            ea = 100

        print("{0:.9f}%".format(ea))
        condition = ea > es

        a.append(xr)
        b.append(ea)
        c.append(i)
        i = i + 1

    plt.subplot(2, 1, 1)
    plt.title('f(x)=1/2 xe^(x^(1/2) )')
    plt.ylabel('Xr')
    plt.plot(c,a,'bo-')
    plt.subplot(2, 1, 2)
    plt.xlabel('Iterasi')
    plt.ylabel('Error (%)')
    plt.plot(c,b,'ro--')
    plt.show()
    

a = list()
b = list()
c = list()
xi = float(1)
xu = float(2)
es = float(0.01)
ea = None

biseksi(xi, xu, es, ea)