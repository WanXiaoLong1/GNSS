function [NAV,NAVHead]=ReadRinexNAV(PathName,NAVName)
clear global;
format long
fid=fopen(strcat(PathName,NAVName),'rt');
if fid==-1
    msgbox("输入地址错误","警告")
    return
end
while(1)
    line1=fgetl(fid);
    if line1==-1
        break
    end
    if findstr(line1,"RINEX VERSION / TYPE")
        NAVHead.version=str2num(line1(6:10));
    end
    if findstr(line1,"PGM / RUN BY / DATE")
        NAVHead.PGM=line1(1:18);
        NAVHead.RUNBY=line1(21:23);
        NAVHead.DATE=line1(41:56);
    end
    if findstr(line1,"ION ALPHA")
        NAVHead.alpha(1)=str2num(line1(5:14));
        NAVHead.alpha(2)=str2num(line1(17:26));
        NAVHead.alpha(3)=str2num(line1(28:38));
        NAVHead.alpha(4)=str2num(line1(40:50));
    end
    if findstr(line1,"ION BETA")
        NAVHead.beta(1)=str2num(line1(5:14));
        NAVHead.beta(2)=str2num(line1(17:26));
        NAVHead.beta(3)=str2num(line1(28:38));
        NAVHead.beta(4)=str2num(line1(41:50));
    end
    if findstr(line1,"DELTA-UTC: A0,A1,T,W")
        NAVHead.utc(1)=str2num(line1(5:22));
        NAVHead.utc(2)=str2num(line1(24:41));
        NAVHead.utc(3)=str2num(line1(45:50));
        NAVHead.utc(4)=str2num(line1(56:59));
    end
    if findstr(line1,"END OF HEADER")
    break
    end
end
    %读内部数据
    i=0;
    while(feof(fid)==0)
        i=i+1;
        line1=fgetl(fid);
        NAV(i).prn=str2num(line1(1:2));
        NAV(i).Year=2000+str2num(line1(4:5));
        NAV(i).Month=str2num(line1(7:8));
        NAV(i).Day=str2num(line1(10:11));
        NAV(i).Hour=str2num(line1(13:14));
        NAV(i).Minute=str2num(line1(16:17));
        NAV(i).Second=str2num(line1(19:20));
   %     Time=[Year,Month,Day,Hour,Minute,Second];
    %    NAV(i).Time=Time;
        NAV(i).deviate=str2num(line1(23:41));
        NAV(i).drift=str2num(line1(42:60));
        NAV(i).rate=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).IODE=str2num(line1(4:22));
        NAV(i).Crs=str2num(line1(23:41));
        NAV(i).dn=str2num(line1(42:60));
        NAV(i).M0=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).Cuc=str2num(line1(4:22));
        NAV(i).e=str2num(line1(23:41));
        NAV(i).Cus=str2num(line1(42:60));
        NAV(i).sqrtA=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).TOE=str2num(line1(4:22));
        NAV(i).Cic=str2num(line1(23:41));
        NAV(i).OMU=str2num(line1(42:60));
        NAV(i).Cis=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).i0=str2num(line1(4:22));
        NAV(i).Crc=str2num(line1(23:41));
        NAV(i).omega=str2num(line1(42:60));
        NAV(i).OMEGAdot=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).idt=str2num(line1(4:22));
        NAV(i).cflgl2=str2num(line1(23:41));
        NAV(i).weekno=str2num(line1(42:60));
        NAV(i).pflgl2=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).svacc=str2num(line1(4:22));
        NAV(i).svhlth=str2num(line1(23:41));
        NAV(i).tgd=str2num(line1(42:60));
        NAV(i).iodc=str2num(line1(61:79));
        line1=fgetl(fid);
        NAV(i).transmit=str2num(line1(4:22));
        NAV(i).fitint=str2num(line1(23:41))
        
    end
end
    


