function xdot = myddesd(t,x,Z)

k1=50;k2=0.1;D=1;c1=50;c2=20;a1=1;a2=1;kar=0.1;rou=1;w1=0.01;b1=0.1;b2=0.2;f1=0;f2=0;



yd=sin(t);
dyd=cos(t);
ddyd=-sin(t);


z1=x(1)-yd;
z2=x(4)-x(5);

for i=1:80;
   s1(i)=exp(-((yd-5+0.125*i)^2+(dyd-5+0.125*i)^2+(x(1)-5+0.125*i)^2+(x(6)-5+0.125*i)^2)/4);
end


for i=1:80;
    f1=f1+s1(i)^2;
end
        
m1=(81*(f1+1))^0.5;

sig1=-(c1*z1)-(z1^3*x(6)*m1^2)/(2*a1^2);



for ii=1:200;
   s2(ii)=exp(-((yd-5+0.05*ii)^2+(dyd-5+0.05*ii)^2+(ddyd-5+0.05*ii)^2+(x(1)-5+0.05*ii)^2+(x(4)-5+0.05*ii)^2+(x(3)-5+0.05*ii)^2+(x(6)-5+0.05*ii)^2)/4); 
end

for ii=1:200;
    f2=f2+s2(ii)^2;
end

m2=(201*(f2+1))^0.5;

v=1/D*(-c2*z2-(z2^3*x(6)*m2^2)/(2*a2^2)-k2*(x(1)-x(3)));



if v>=b2;
    p=-D*b2;
elseif -b1<v && v<b2;
    p=-v*D;
else
    p=D*b1;
end

diary on
disp(t)




xdot=[    x(2)+0.2*cos(x(1)*x(2))+(0.01*x(2)*x(1)+0.01)*wgn(1,1,5) 
          v*D+p+0.1*sin(x(1)^2*x(2))+0.01*(0.2+x(1)^2)*x(2)*wgn(1,1,5)   
          x(4)+k1*(x(1)-x(3))
          v*D+p+k2*(x(1)-x(3))
          (sig1-x(5))/w1
          rou*((z1^6*m1^2)/(2*a1^2)+(z2^6*m2^2)/(2*a2^2)-kar*x(6))
    ];

end




 

   
