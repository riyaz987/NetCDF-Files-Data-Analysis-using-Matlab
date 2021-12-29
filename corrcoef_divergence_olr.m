
lon=ncread('ERA5 Ucomp.nc','longitude');
lat=ncread('ERA5 Ucomp.nc','latitude');
time=ncread('ERA5 Ucomp.nc','time');
U=ncread('ERA5 Ucomp.nc','u');
V=ncread('ERA5 Vcomp.nc','v');
longitude=(find(lon==55):find(lon==90));
latitude=lat(241:361);

olr=ncread('olr_msc.nc','olr');
lon1=ncread('olr_msc.nc','lon');
lat1=ncread('olr_msc.nc','lat');
time1=ncread('olr_msc.nc','time');
%%
matdate=((time/24)+datenum(1900,0,0));
matdate=double(matdate);
date= datevec(matdate);

U1=U(221:361,241:361,1,:);
V1=V(221:361,241:361,1,:);
U1=squeeze(U1);
V1=squeeze(V1);


%%
dx=1
dy=1
dz=1

W1(141,121,60)=0;
 for i=2:141
     W1(i,1,:)=(((U1(i,1,:)-U1(i-1,1,:))/dx)+((V1(i,1,:)-V1(i,121,:))/dy))*dz;
 end
for j=2:121
   W1(1,j,:)=(((U1(1,j,:)-U1(141,j,:))/dx)+((V1(1,j,:)-V1(1,j-1,:))/dy))*dz;
end
for i=2:141
    for j=2:121
         W1(i,j,:)=(((U1(i,j,:)-U1(i-1,j,:))/dx)+((V1(i,j,:)-V1(i,j-1,:))/dy))*dz;
    end
end
%%
W=mean(mean(W1));
W=squeeze(W)
%%

%converting daily olr values into monthly values

matdate1=((time1/24)+datenum(1800,0,0));
matdate1=double(matdate1);
date1= datevec(matdate1);


olr1=olr(23:37,25:37,1:1797);
for i = 1:5
     for j = 1:12
    idx = find(date1(:,1)==1995+i & date1(:,2)==j);
    olr_new(i,j) = {olr(:,:,idx)};
    olr_mean_month(i,j) = mean(mean(mean(olr_new{i,j})));

     end
end
%%
olr_mean_month=olr_mean_month';
olr_reshaped = reshape(olr_mean_month,[],1);

r=corrcoef(olr_reshaped,W)
plot(W,olr_reshaped,'*')