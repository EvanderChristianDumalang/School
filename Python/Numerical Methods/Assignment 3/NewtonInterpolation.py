import numpy as np

def coefInterpolasiNewton(y_data, z_data):
    m = len(y_data)

    x = np.copy(y_data)
    a = np.copy(z_data)
    for k in range(1, m):
        a[k : m] = (a[k : m] - a[k - 1])/(x[k : m] - x[k - 1])

    return a

def InterpolasiNewton(y, z):
    a = coefInterpolasiNewton(y, z)
    n = len(y) - 1
    p = a[n]

    for k in range(1, n + 1):
        p = a[n - k] + (x - y[n - k])*p

    return p

# Data Input Sendiri
'''arr1 = input('Masukkan Array1: ')
arr2 = input('Masukkan Array1: ')
y_data = list(map(float,arr1.split(' ')))
z_data = list(map(float,arr2.split(' ')))
x = float(input("Masukkan Angka yang Ingin dicari: "))'''

# Data Buat Test
x = 11.5
y_data = [10.5, 12, 12.4, 12.8]
z_data = [45.2, 58.1, 60.2, 64.4]

f3 = InterpolasiNewton(y_data, z_data)
et = abs((55.92-f3)/55.92)*100
print('----------------------------------------\n')
print('x = ', x)
print('y = ', y_data)
print('z = ', z_data)
print("Nilai Interpolasi Newton: ", "{0:.4f}".format(f3))
# Nilai  E True 55.92 Berdasarkan soal yang pernah jadi contoh
print("Nilai E True:", "{0:.4f}%".format(et))
