function [delt]=dxdydz(Sp3,posxyz)
clear global
format long;
for i=1:60
    delt(i).dx=posxyz(i).x-Sp3((i-1)*8+1).x*1000;
    delt(i).dy=posxyz(i).y-Sp3((i-1)*8+1).y*1000;
    delt(i).dz=posxyz(i).z-Sp3((i-1)*8+1).z*1000;
end
end
