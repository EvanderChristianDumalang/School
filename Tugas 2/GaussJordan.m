clear;
clc;
A = xlsread('Book1.xlsx','Sheet1','A1:C3');
c = xlsread('Book1.xlsx','Sheet1','A5:A7');

aug = [ A c]
[n,m] = size(aug);

for j=1:n-1
    for z=2:n
        if aug(j,j)==0
            t=aug(1,:);aug(1,:)=aug(z,:);
            aug(z,:)=t;
        end
    end
    for i=j+1:n
        aug(i,:)=aug(i,:)-aug(j,:)*(aug(i,j)/aug(j,j));
    end
end

for j=n:-1:2
    for i=j-1:-1:1
        aug(i,:)=aug(i,:)-aug(j,:)*(aug(i,j)/aug(j,j));
    end
end

for s=1:n
    aug(s,:)=aug(s,:)/aug(s,s);
    x(s)=aug(s,m);
end
disp('Gauss-Jordan method:');
aug
x
