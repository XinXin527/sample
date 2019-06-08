u1=25;
u2=25;
sigma=0.5;
x=[0:0.05:50];
y=[0:0.05:50];
[X,Y]=meshgrid(x,y);
xy=(1/(2*pi*(sigma^2)))*exp((-((X-u1).^2+(Y-u2).^2))/(2*(sigma.^2)));
figure(1);
surf(X,Y,xy);
title('ԭ��˹����');
hold on;
figure(2);
XY=fftshift(abs(fft2(xy)));
surf(Y,X,XY);
title('��˹��������Ҷ�任');
hold on;
xyp=zeros(1001,1001);
for i=1:1:201
    p1=5*(i-1)+1;
    p2=5*(i-1)+2;
    p3=5*(i-1)+3;
    for j=1:1:201
        q1=5*(j-1)+1;
        q2=5*(j-1)+2;
        q3=5*(j-1)+3;
        xyp(p1,q1)=1;
        xyp(p1,q2)=1;
        xyp(p1,q3)=1;
        xyp(p2,q1)=1;
        xyp(p2,q2)=1;
        xyp(p2,q3)=1;
        xyp(p3,q1)=1;
        xyp(p3,q2)=1;
        xyp(p3,q3)=1;
    end
end
xypp=zeros(1001,1001);
for i=1:1:1001
    for j=1:1:1001
        xypp(i,j)=xy(i,j)*xyp(i,j);
    end
end
figure(3);
surf(X,Y,xypp);
title('������õ�������');
hold on;
XYp=fftshift(abs(fft2(xypp)));
figure(4);
surf(Y,X,XYp);
title('�����������������Ҷ�任�õ��Ľ��');
hold on;
lvbo=zeros(1001,1001);
for i=400:1:600
    for j=400:1:600
        lvbo(j,i)=25/9;
    end
end
XYpp=zeros(1001,1001);
for j=1:1:1001
    for i=1:1:1001
        XYpp(j,i)=lvbo(j,i)*XYp(j,i);
    end
end
figure(5);
surf(Y,X,XYpp);
title('Ƶ���˲���Ľ��');
hold on;
XX=ifftshift(abs(ifft2(XYpp)));
figure(6);
surf(X,Y,XX);
title('�ָ���ԭ�ź�');
figure(7);
surf(X,Y,xy);
hold on;
surf(X,Y,XX);
legend('ԭ��˹����','�ָ��ĸ�˹����');
title('����Ƚ�');