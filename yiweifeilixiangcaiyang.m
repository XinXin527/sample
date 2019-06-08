u=25;
sigma=0.5;
x=0:0.05:50;
y=(1/(sqrt(2*pi)*sigma))*exp(-(((x-u).^2)/(2*(sigma.^2))));
figure(1);
plot(x,y);
title('ԭ��˹����');
hold on;
figure(2);
Y=fftshift(abs(fft(y)));
plot(x,Y);
title('��˹��������Ҷ�任');
hold on;
xp=zeros(1,1001);
for i=1:1:201
    p1=5*(i-1)+1;
    p2=5*(i-1)+2;
    p3=5*(i-1)+3;
    xp(1,p1)=1;
    xp(1,p2)=1;
    xp(1,p3)=1;
end
xpp=zeros(1,1001);
for j=1:1:1001
    xpp(1,j)=y(1,j)*xp(1,j);
end
figure(3);
stem(x,xpp);
title('������õ�������');
hold on;
yp=fftshift(abs(fft(xpp)));
figure(4);
plot(x,yp);
title('�����������������Ҷ�任�õ��Ľ��');
hold on;
lvbo=zeros(1,1001);
for i=400:1:600
    lvbo(1,i)=5/3;
end
Yp=zeros(1,1001);
for j=1:1:1001
    Yp(1,j)=lvbo(1,j)*yp(1,j);
end
figure(5);
plot(x,Yp);
title('Ƶ���˲���Ľ��');
hold on;
X=ifftshift(abs(ifft(Yp)));
figure(6);
plot(x,X);
title('�ָ���ԭ�ź�');
figure(7);
plot(x,y);
hold on;
plot(x,X);
legend('ԭ��˹����','�ָ��ĸ�˹����');
title('����Ƚ�');