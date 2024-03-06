clear all

sol = ddesd(@myddesd,@fundelays,[0.1 0.5 0.5 0 0 0 0 0 1],[0 60]);
 



k1=10;k2=10;k3=10;a1=1;a2=1;a3=20;kar=0.5;
D=1;c1=100;c2=200;c3=200;rou=2;w1=0.2;w2=0.01;b1=0.1;b2=0.2;f1=0;f2=0;f3=0;

yd=0.2*(sin(sol.x)+sin(0.8*sol.x));  
dyd=0.2*(cos(sol.x)+0.8*cos(0.8*sol.x));
ddyd=0.2*(-sin(sol.x)-0.64*sin(0.8*sol.x));
dddyd=0.2*(-cos(sol.x)-0.512*cos(0.8*sol.x));


%%
for i=1:80;
   s1(i,:)=exp(-((yd-5+0.125*i).^2+(dyd-5+0.125*i).^2+(sol.y(1,:)-5+0.125*i).^2+(sol.y(9,:)-5+0.125*i).^2)/4);
end

for ii=1:80;
   s2(ii,:)=exp(-((yd-5+0.125*ii).^2+(dyd-5+0.125*ii).^2+(ddyd-5+0.125*ii).^2+(sol.y(1,:)-5+0.125*ii).^2+(sol.y(4,:)-5+0.125*ii).^2+(sol.y(5,:)-5+0.125*ii).^2+(sol.y(9,:)-5+0.125*ii).^2)/4); 
end

for iii=1:80;
   s3(iii,:)=exp(-((yd-5+0.125*iii).^2+(dyd-5+0.125*iii).^2+(ddyd-5+0.125*iii).^2+(dddyd-5+0.125*iii).^2+(sol.y(1,:)-5+0.125*iii).^2+(sol.y(4,:)-5+0.125*iii).^2+(sol.y(5,:)-5+0.125*iii).^2+(sol.y(6,:)-5+0.125*iii).^2+(sol.y(9,:)-5+0.125*iii).^2)/4); 
end

z1=sol.y(1,:)-yd;
z2=sol.y(5,:)-sol.y(7,:);
z3=sol.y(6,:)-sol.y(8,:);



for i=1:80;
    f1=f1+s1(i,:).^2;
end

for ii=1:80;
    f2=f2+s2(ii,:).^2;
end

for iii=1:80;
    f3=f3+s3(iii,:).^2;
end






m1=(81*(f1+1)).^0.5;

sig1=-(c1*z1)-(z1.^3.*sol.y(9,:).*m1.^2)./(2.*a1.^2);


m2=(81*(f2+1)).^0.5;

sig2=(-c2*z2)-(z2.^3.*sol.y(9,:).*m2.^2)./(2.*a2.^2)-k2.*(sol.y(1,:)-sol.y(4,:));



m3=(81*(f3+1)).^0.5;
v=1/D.*(-c3.*z3-(z3.^3.*sol.y(9,:).*m3.^2)/(2.*a3.^2)-k3.*(sol.y(1,:)-sol.y(4,:)));


% bbb=abs(sol.y(1,:)-yd); %IAEz1
% trapz(sol.x,bbb)

% aaa=(sol.y(5,:)-yd).^2;%ISEz1
% trapz(sol.x,aaa)




% bbb=abs(sol.y(5,:)-sol.y(7,:)); %IAEz2
% trapz(sol.x,bbb)


% aaa=(sol.y(5,:)-sol.y(7,:)).^2;%ISEz2
% trapz(sol.x,aaa)











%%
figure(1)
plot(sol.x,sol.y(1,:)-yd,'r','linewidth',1.5);    %y-yd
hold on 

figure(2)
plot(sol.x,sol.y(1,:),'r',sol.x,yd,'b');    %y ºÍ yd

figure(3)
plot(sol.x,sol.y(1,:),'b');
hold on;
plot(sol.x,sol.y(4,:),'g');

figure(4)
plot(sol.x,sol.y(2,:),'b');
hold on;
plot(sol.x,sol.y(5,:),'g');

figure(5)
plot(sol.x,sol.y(3,:),'b');
hold on;
plot(sol.x,sol.y(6,:),'g');
% 
figure(6)
plot(sol.x,v,'g');

figure(7)
plot(sol.x,sol.y(9,:),'black');



