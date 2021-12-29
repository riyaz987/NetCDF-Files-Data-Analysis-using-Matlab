clc
clear
U=ncread('ERA5 Ucomp.nc','u');
V=ncread('ERA5 Vcomp.nc','v');
lon=ncread('ERA5 Ucomp.nc','longitude');
lat=ncread('ERA5 Ucomp.nc','latitude');
time=ncread('ERA5 Ucomp.nc','time');
olr=ncread('olr_msc.nc','olr');
lon1=ncread('olr_msc.nc','lon');
lat1=ncread('olr_msc.nc','lat');
time1=ncread('olr_msc.nc','time');
matdate=((time/24)+datenum(1900,0,0));

matdate=double(matdate);
date= datevec(matdate);

matdate1=((time1/24)+datenum(1800,0,0));
matdate1=double(matdate1);
date1= datevec(matdate1);

%%
month=date(:,2);
year=date(:,1);
birthdate=find(year==1999 & month== 3);
olr_birthday=olr(:,:,40);

month1=date1(:,2);
year1=date1(:,1);
day=date1(:,3)
birthdate1=find(year1==1999 & month1== 3 );
mean_birthday1=mean(birthdate1);
olr_birthday1=olr(:,:,1172);
pcolor(lon1,lat1,olr_birthday1'); shading flat; colorbar
%%
dx=1
dy=1
dz=1
W(1440,721)=0;
 for i=2:1440
     W(i,1)=-(((U(i,1)-U(i-1,1))/dx)+((V(i,1)-V(i,721))/dy))*dz;
 end
for j=2:721
   W(1,j)=-(((U(1,j)-U(1440,j))/dx)+((V(1,j)-V(1,j-1))/dy))*dz;
end
for i=2:1440
    for j=2:721
         W(i,j)=-(((U(i,j)-U(i-1,j))/dx)+((V(i,j)-V(i,j-1))/dy))*dz;
    end
end
subplot(1,2,1)
pcolor(lon1,lat1,olr_birthday1'); shading flat; colorbar
subplot(1,2,2)
pcolor(lon,lat,W'); shading flat; colorbar
caxis([-1 1])