clear
clc
pathname="D:\weixingceshi\";
NAVName="ceshi.txt";
%OBSName="hksl0930.22o";
%[OBSHead,OBSBody]=ReadOBS(pathname,OBSName);
%Sp3Name="igs21906.sp3"
%[Sp3]=ReadSp3(pathname,Sp3Name);
[NAV,NAVHead]=ReadRinexNAV(pathname,NAVName);
[posxyz]=eph2pos(NAV);
%[delt]=dxdydz(Sp3,posxyz);
%clear globle
%for i= 1:59 
 %   x(i)=delt(i).dx;
%end
%for j= 1:59
%     y(j)=delt(j).dy;
%end
%for p=1:59
%     z(p)=delt(p).dz;
%end
%x=[delt(1).dx,delt(2).dx,delt(3).dx,delt(4).dx]
%plot(x,'r');
%hold on;
%plot(y,'g');
%hold on;
%plot(z,'b');
%plot(x,'r')
