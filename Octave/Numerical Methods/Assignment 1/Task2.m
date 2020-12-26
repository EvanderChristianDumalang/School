clc;
close all;
prompt = 'Orde Berapa?';
n = input(prompt);

x = [6.5079 8.0814 3.9090 6.1082 9.9294 9.9629 2.2558 3.0724 1.5146 5.4081];
y = [16.41 16.6266 15.9 16.3467 16.8325 16.8359 15.3505 15.6594 14.9522 16.2245];

xp = input('Interpolasi Angka Baru: ');
yp = 0;
for i = 1:n+1
    
    p = 1;
    
    for j = 1:n+1
        if i != j
            p = p * (xp - (x(j))) / (x(i)- x(j));
            
        endif
    endfor
    fprintf('Iterasi-%d, p = %0.4f\n' ,i, p);
    yp = yp + p * y(i);
endfor
fprintf('Hasil Interpolasi Pada %.3f adalah %.3f.' ,xp, yp) 