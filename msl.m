mslp=ncread('sspressure.nc','msl');
lon=ncread('sspressure.nc','longitude');
lat=ncread('sspressure.nc','latitude');
time=ncread('sspressure.nc','time');
p1=mslp(1:41,:,:);
p2=mslp(81:121,:,:);
dx=20*100*110;
mp1=mean(mean(p1,1),2);
mp2=mean(mean(p2,1),2);
dp=(mp2-mp1)/dx;
dp=squeeze(dp);
%%
u=ncread('ERA5 Ucomp.nc','u');
v=ncread('ERA5 Vcomp.nc','v');
lon1=ncread('ERA5 Ucomp.nc','longitude');
lat1=ncread('ERA5 Ucomp.nc','latitude');
time1=ncread('ERA5 Ucomp.nc','time');
%%
u1=u(241:281,241:361,6:9);
u2=u(321:361,241:361,6:9);
mu1=mean(mean(u1,1),2);
mu2=mean(mean(u2,1),2);
dudx=(mu2-mu1)./dx;
dudx=squeeze(dudx);

dudt_e(:,:,1)=(mu2(1,1,2)-mu2(1,1,1))./(31*24*60*60-30*24*60*60);
dudt_e(:,:,2)=(mu2(1,1,3)-mu2(1,1,2))./(31*24*60*60-31*24*60*60);
dudt_e(:,:,3)=(mu2(1,1,4)-mu2(1,1,3))./(30*24*60*60-31*24*60*60);
dudt_e=squeeze(dudt_e);

dudt_w(:,:,1)=(mu1(1,1,2)-mu1(1,1,1))./(31*24*60*60-30*24*60*60);
dudt_w(:,:,2)=(mu1(1,1,3)-mu1(1,1,2))./(31*24*60*60-31*24*60*60);
dudt_w(:,:,3)=(mu1(1,1,4)-mu1(1,1,3))./(30*24*60*60-31*24*60*60);
dudt_w=squeeze(dudt_w);
for i=1:4
aa(i)=(mu2(i).*dudx(i));
end
for i=1:4
aa1(i)=(mu2(i).*dudx(i));
end