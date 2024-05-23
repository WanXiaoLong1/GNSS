function [posxyz]=eph2pos(NAV)
clear global;

l=0
z=1
        [JD]=GeLi2RuLue(2022,1,1,12,0,0);
        [WN,TOW]=RuLue2GPST(JD);
        dt_tk=TOW-NAV(z).TOE
        l=l+1;
%dt_tk=OBSBody - NAV(1).TOE;
format long;
%i=2
%计算平均角速度
n0=sqrt(3.986005E+14)/((NAV(z).sqrtA)^3);
n=n0+NAV(z).dn;
%计算平近点角
tk=dt_tk;
%t=t-(NAV(i).deviate+NAV(i).drift*(t-NAV(i).TOE)+NAV(i).rate*(t-NAV(i).TOE)*(t-NAV(i).TOE));
%tk=t-NAV(i).TOE;
M=NAV(z).M0+n*tk;
%计算偏近点角
E=M;
Ek=0.0;
while abs(E-Ek)>1e-12
    Ek=E;
    E=M+NAV(z).e*sin(Ek);
end
%计算真近点角
ft=atan2(sqrt(1-NAV(z).e*NAV(z).e)*sin(E),(cos(E)-NAV(z).e))
%计算升交距角（未经改正）
u=NAV(z).omega+ft;
%计算摄动改正项
r=NAV(z).sqrtA*NAV(z).sqrtA*(1-NAV(z).e*cos(E));
i=NAV(z).i0+NAV(z).idt*tk;
%改正后的升交距角、卫星矢径、轨道倾角
sin2u=sin(2*u);
cos2u=cos(2*u);
cus=NAV(z).Cus
cuc=NAV(z).Cuc
crs=NAV(z).Crs
crc=NAV(z).Crc
cis=NAV(z).Cis
cic=NAV(z).Cic
uk=u+cus*sin2u+cuc*cos2u;
rk=r+crs*sin2u+crc*cos2u;
ik=i+cis*sin2u+cic*cos2u;
%计算卫星在轨道面坐标系中的坐标
x=rk*cos(uk);
y=rk*sin(uk);
%计算发射时刻升交点的精度
L=NAV(z).OMU+(NAV(z).OMEGAdot-7.29211567E-5)*tk-7.292115E-5*NAV(z).TOE;
%计算卫星在地固坐标系下的坐标
posxyz(l).prn=NAV(z).prn
posxyz(l).x=x*cos(L)-y*cos(ik)*sin(L);
posxyz(l).y=x*sin(L)+y*cos(ik)*cos(L);
posxyz(l).z=y*sin(ik);
    end

