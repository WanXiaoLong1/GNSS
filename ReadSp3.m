function [Sp3]=ReadSp3(PathName,Sp3Name)
clear global;
format long;
fid=fopen(strcat(PathName,Sp3Name),'rt');
line=fgetl(fid);
year=str2num(line(4:7));
while (1)
line=fgetl(fid);
if line(43:48)=="YN ORB"
    break
end
end
v=0
while(feof(fid)==0)
line=fgetl(fid);
if(line(1:3)=="EOF")
    break;
end
if str2num(line(4:7))==year
    time=str2num(line(15:16))*3600+str2num(line(18:19))*60+str2num(line(21:22));
end
if findstr(line,"PG01")
    v=v+1;
    Sp3(v).time=time;
    Sp3(v).prn=str2num(line(3:4));
    Sp3(v).x=str2num(line(6:18));
    Sp3(v).y=str2num(line(20:32));
    Sp3(v).z=str2num(line(34:46));
end
%Sp3(l).Nian=str2num(line(4:7));
%Sp3(l).Yue=str2num(line(9:10));
%Sp3(l).Ri=str2num(line(12:13));
%Sp3(l).Shi=str2num(line(15:16));
%Sp3(l).Fen=str2num(line(18:19));
%Sp3(l).Miao=str2num(line(21:31));
%for q=1:32 
%line=fgetl(fid);
%Sp3(l,q).prn=str2num(line(3:4));
%Sp3(1,q).x=str2num(line(6:18));
%Sp3(1,q).y=str2num(line(20:32));
%Sp3(1,q).z=str2num(line(34:46));
end
end