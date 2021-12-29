clc
clear
U=ncread('ERA5 Ucomp.nc','u');
V=ncread('ERA5 Vcomp.nc','v');
lon=ncread('ERA5 Ucomp.nc','longitude');
lat=ncread('ERA5 Ucomp.nc','latitude');
time=ncread('ERA5 Ucomp.nc','time');

matdate=((time/24)+datenum(1900,0,0));

matdate=double(matdate);
date= datevec(matdate);
%%
month=date(:,2);
date1=find(month==1 | month==2 | month==12);
date2=find(month==3 | month==4 | month==5);
date3=find(month==6 | month==7 | month==8);
date4=find(month==9 | month==10 | month==11);
%%
U1=U(:,:,1,date1);
U2=U(:,:,1,date2);
U3=U(:,:,1,date3);
U4=U(:,:,1,date4);

V1=V(:,:,1,date1);
V2=V(:,:,1,date2);
V3=V(:,:,1,date3);
V4=V(:,:,1,date4);
%%
U1=mean(U1,4);
U2=mean(U2,4);
U3=mean(U3,4);
U4=mean(U4,4);

V1=mean(V1,4);
V2=mean(V2,4);
V3=mean(V3,4);
V4=mean(V4,4);
%%
subplot(2,2,1)
quiver(lon,lat,U1',V1')
subplot(2,2,2)
quiver(lon,lat,U2',V2')
subplot(2,2,3)
quiver(lon,lat,U3',V3')
subplot(2,2,4)
quiver(lon,lat,U4',V4')







