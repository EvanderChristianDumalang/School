import numpy as np

def coefnewarrayy(y_data):
  start = 0
  i = 0
  while y_data[start] < x:
    start += 1
    i += 1
  y = np.array([y_data[i-1], y_data[i]])
  return y

def coefnewarrayz(z_data):
  start = 0
  i = 0
  while y_data[start] < x:
    start += 1
    i += 1
  z = np.array([z_data[i-1], z_data[i]])
  return z

def coefInterpolasiSplineOrde1(ydata, zdata):
  ydata = coefnewarrayy(y_data)
  zdata = coefnewarrayz(z_data)
  m = len(ydata)

  x = np.copy(ydata)
  a = np.copy(zdata)
  for k in range(1, m):
      a[k : m] = (a[k : m] - a[k - 1])/(x[k : m] - x[k - 1])

  return a

def InterpolasiSplineOrde1(y, z):
    y = coefnewarrayy(y_data)
    z = coefnewarrayz(z_data)
    a = coefInterpolasiSplineOrde1(y, z)
    n = len(y)-1
    p = a[n]

    for k in range(1, n+1):
        p = a[n - k] + (x - y[n - k])*p

    return p

x = 0.6
y_data = [0.0, 0.1, 0.4, 0.5, 0.75, 1.0]
z_data = [1.3, 4.5, 2.0, 2.1, 5.0,  3.0]
f3 = InterpolasiSplineOrde1(y_data, z_data)

print('x = ', x)
print('y = ', coefnewarrayy(y_data))
print('z = ', coefnewarrayz(z_data))

print("Nilai Interpolasi Newton: ", "{0:.4f}".format(f3))