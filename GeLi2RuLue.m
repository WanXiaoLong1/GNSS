function [JD]=GeLi2RuLue(Year,Month,Day,Hour,Minue,Miao)
 H=Hour+Minue/60+Miao/3600;
if (Month<=2)
    y=Year-1;
    m=Month+12;
else
    y=Year;
    m=Month;
end
JD=floor(365.25*y)+floor(30.6001*(m+1))+Day+H/24+1720981.5;
end
