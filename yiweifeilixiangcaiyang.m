u=25;
sigma=0.5;
x=0:0.05:50;
y=(1/(sqrt(2*pi)*sigma))*exp(-(((x-u).^2)/(2*(sigma.^2))));
figure(1);
plot(x,y);
title('原高斯函数');
hold on;
figure(2);
Y=fftshift(abs(fft(y)));
plot(x,Y);
title('高斯函数傅里叶变换');
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
title('采样后得到的序列');
hold on;
yp=fftshift(abs(fft(xpp)));
figure(4);
plot(x,yp);
title('采样后的序列做傅里叶变换得到的结果');
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
title('频域滤波后的结果');
hold on;
X=ifftshift(abs(ifft(Yp)));
figure(6);
plot(x,X);
title('恢复的原信号');
figure(7);
plot(x,y);
hold on;
plot(x,X);
legend('原高斯函数','恢复的高斯函数');
title('方便比较');