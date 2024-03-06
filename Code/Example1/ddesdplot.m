clear all

sol = ddesd(@myddesd,@fundelays,[0.2 0 1 0 0 0.5],[0 15]);
 


k1=50;k2=0.1;D=1;c1=50;c2=20;a1=1;a2=1;kar=0.1;rou=1;w1=0.01;b1=0.1;b2=0.2;f1=0;f2=0;

yd=sin(sol.x);
dyd=cos(sol.x);
ddyd=-sin(sol.x);

for i=1:80;
   s1(i,:)=exp(-((yd-5+0.125*i).^2+(dyd-5+0.125*i).^2+(sol.y(1,:)-5+0.125*i).^2+(sol.y(6,:)-5+0.125*i).^2)/4);
end

for ii=1:200;
   s2(ii,:)=exp(-((yd-5+0.05*ii).^2+(dyd-5+0.05*ii).^2+(ddyd-5+0.05*ii).^2+(sol.y(1,:)-5+0.05*ii).^2+(sol.y(4,:)-5+0.05*ii).^2+(sol.y(3,:)-5+0.05*ii).^2+(sol.y(6,:)-5+0.05*ii).^2)/4); 
end

z1=sol.y(1,:)-yd;
z2=sol.y(4,:)-sol.y(5,:);

for i=1:80;
    f1=f1+s1(i,:).^2;
end

for ii=1:200;
    f2=f2+s2(ii,:).^2;
end

m1=(81*(f1+1)).^0.5;

sig1=-(c1*z1)-(z1.^3.*sol.y(6,:).*m1.^2)./(2.*a1.^2);


m2=(201*(f2+1)).^0.5;

v=1/D.*(-c2.*z2-(z2.^3.*sol.y(6,:).*m2.^2)/(2.*a2.^2)-k2.*(sol.y(1,:)-sol.y(3,:)));

w(1,:)=sol.y(1,:)./(sol.y(2,:)+0.2.*cos(sol.y(1,:).*sol.y(2,:))+0.01.*sol.y(2,:).*sol.y(1,:));

figure(1)
plot(sol.x,sol.y(1,:)-yd,'r','linewidth',1.5);    %y-yd
hold on 

figure(2)
plot(sol.x,sol.y(1,:),'r',sol.x,yd,'b');    %y ºÍ yd

figure(3)
plot(sol.x,sol.y(1,:),'r');
hold on;
plot(sol.x,sol.y(3,:),'b');

figure(4)
plot(sol.x,v,'g');

figure(5)
plot(sol.x,sol.y(2,:),'r');
hold on;
plot(sol.x,sol.y(4,:),'b');

figure(6)
plot(sol.x,sol.y(6,:),'g');
 






