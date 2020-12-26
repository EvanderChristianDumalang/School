import math
import matplotlib.pyplot as plt
 
def f(x):
    return x**(5/2)+1/2*(math.sqrt(x))-3/5
 
def g(x):
    return (10*x*abs(x)+1)/(4*math.sqrt(x))
    
def biseksi(xi,xu,es,ea):
    print("Bisection Method")
    i = 1
    condition = True
    a = list()
    b = list()
    c = list()
    print('Iterasi Awal Dijadikan 100% Karena Tidak Ada Kesalahan Iterasi Yang Terjadi')
    while condition: 
        xr = (xi + xu)/2
        print('Iterasi-%d, xi = %0.4f, xu = %0.4f, xr = %0.4f, f(xi) = %0.4f, f(xu) = %0.4f, f(xr) = %0.4f, ea =' % (i, xi, xu, xr, f(xi), f(xu), f(xr)), end=" ")
          
        if f(xi) * f(xr) < 0 :
            xu = xr
            ea = abs((xr-xi)/xr)*100
        else:
            xi = xr
            ea = abs((xr-xu)/xr)*100
        if i == 1 :
            ea = 100
 
        print("{0:.4f}%".format(ea))
        condition = ea > es
        a.append(xr)
        b.append(ea)
        c.append(i)
        i = i + 1
    plt.subplot(2, 1, 1)
    plt.title('f(x)=(x^5/2)+1/2*(x^1/2)-3/5')
    plt.ylabel('Xr')
    plt.plot(c,a,'bo-')
    plt.subplot(2, 1, 2)
    plt.xlabel('Iterasi')
    plt.ylabel('Error (%)')
    plt.plot(c,b,'ro--')
    plt.show()
 
def InterpolasiLinear(xi,xu,es,ea):
    print("Interpolasi Linear Method")
    a = list()
    b = list()
    c = list()
    i = 1
    print('Iterasi Awal Dijadikan 100% Karena Tidak Ada Kesalahan Iterasi Yang Terjadi')
    condition = True
    while condition:
        xr = xu-((f(xu))*(xi-xu))/((f(xi))-(f(xu)))
        print('Iterasi-%d, xi = %0.4f, xu = %0.4f, xr = %0.4f, f(xi) = %0.4f,  f(xu) = %0.4f, f(xr) = %0.4f, ea =' % (i, xi, xu, xr, f(xi), f(xu), f(xr)), end=" ")
        if ea is None: 
          ea = 100
          condition =  ea > es
        else:
          ea = abs((xr-xi)/xr)*100 
        if f(xi) * f(xr) < 0:
            xu = xr
        else:
            xi = xr
      
        print("{0:.4f}%".format(ea))
        condition = ea > es
 
        a.append(xr)
        b.append(ea)
        c.append(i)
        i = i + 1
 
    plt.subplot(2, 1, 1)
    plt.title('f(x)=(x^5/2)+1/2*(x^1/2)-3/5')
    plt.ylabel('Xr')
    plt.plot(c,a,'bo-')
    plt.subplot(2, 1, 2)
    plt.xlabel('Iterasi')
    plt.ylabel('Error (%)')
    plt.plot(c,b,'ro--')
    plt.show()
 
def newtonRaphson(xi,es,ea):
    print("Newton Raphson Method")
    i = 1
    condition = True
    a = list()
    b = list()
    c = list()
    print('Iterasi Awal Dijadikan 100% Karena Tidak Ada Kesalahan Iterasi Yang Terjadi')
    while condition:
      xnew = xi - f(xi)/g(xi)
      print('Iterasi-%d, xi = %0.4f, f(xi) = %0.4f, g(xi) = %0.4f, xnew = %0.4f, ea =' % (i, xi, f(xi), g(xi), xnew), end=" ")
      if ea is None: 
          ea = 100
          condition =  ea > es
      else:
          ea = abs((xnew-xi)/xnew)*100 
      xi = xnew
      print("{0:.4f}%".format(ea))
      condition = ea > es
      a.append(xnew)
      b.append(ea)
      c.append(i)
      i = i + 1
 
    plt.subplot(2, 1, 1)
    plt.title('f(x)=(x^5/2)+1/2*(x^1/2)-3/5')
    plt.ylabel('Xnew')
    plt.plot(c,a,'bo-')
    plt.subplot(2, 1, 2)
    plt.xlabel('Iterasi')
    plt.ylabel('Error (%)')
    plt.plot(c,b,'ro--')
    plt.show()
 
def secant(xi,xu,es,ea):
    print("Secant Method")
    i = 1
    condition = True
    a = list()
    b = list()
    c = list()
    print('Iterasi Awal Dijadikan 100% Karena Tidak Ada Kesalahan Iterasi Yang Terjadi')
    while condition:
        if f(xi) == f(xu):
           print('Divide by zero error!')
           break
        xr = xu-((f(xu))*(xu-xi))/((f(xu))-(f(xi)))
        print('Iterasi-%d, xi = %0.4f, xu = %0.4f, f(xi) = %0.4f,  f(xu) = %0.4f, xr = %0.4f, ea =' % (i, xi, xu, f(xi), f(xu), xr), end=" ")
        if ea is None: 
          ea = 100
          condition =  ea > es
        else:
          ea = abs((xr-xu)/xr)*100 
        xi = xu
        xu = xr
        print("{0:.4f}%".format(ea))
        condition = ea > es
 
        a.append(xr)
        b.append(ea)
        c.append(i)
        i = i + 1
      
    plt.subplot(2, 1, 1)
    plt.title('f(x)=(x^5/2)+1/2*(x^1/2)-3/5')
    plt.ylabel('Xr')
    plt.plot(c,a,'bo-')
    plt.subplot(2, 1, 2)
    plt.xlabel('Iterasi')
    plt.ylabel('Error (%)')
    plt.plot(c,b,'ro--')
    plt.show()
 
xi = float(0.5)
xu = float(2)
es = float(2)
ea = None
 
biseksi(xi, xu, es, ea)
print("\n---------------------------------------------------------------------------------------------------")
InterpolasiLinear(xi,xu,es,ea)
print("\n---------------------------------------------------------------------------------------------------")
newtonRaphson(xi,es,ea)
print("\n---------------------------------------------------------------------------------------------------")
secant(xi,xu,es,ea)