clc
clear
file1='msl_96-20_region.nc';
file2='uwind_96-20_region.nc';
lon1=ncread(file1,'longitude');
lat1=ncread(file1,'latitude');
time1=ncread(file1,'time');
mslp=ncread(file1,'msl');

%lon2=ncread(file2,'longitude');
%lat2=ncread(file2,'latitude');
%time2=ncread(file2,'time');
uwind=ncread(file2,'u');

%%
mslp_avg=mean(mslp,3);
mslp6070=mslp(:,1:41,:);
mslp8090=mslp(:,81:121,:);
mslp6070_avg=mean(mean(mslp6070,1),2);
mslp6070_avg=squeeze(mslp6070_avg)
mslp8090_avg=mean(mean(mslp8090,1),2);
mslp8090_avg=squeeze(mslp8090_avg)
dx=20*110*100

pgrad=(mslp8090_avg-mslp6070_avg)/dx;
pgrad1=pgrad(1:3);
pgrad2=pgrad(5:7);
pgrad3=pgrad(9:11);
pgrad4=pgrad(13:15);
pgrad5=pgrad(17:19);
pgrad15=[pgrad1 pgrad2 pgrad3 pgrad4 pgrad5];
pgrad15=reshape(pgrad15,[],1)
%%
uwind6070=uwind(:,1:41,:);
uwind8090=uwind(:,81:121,:);
uwind6070_avg=mean(mean(uwind6070,1),2);
uwind6070_avg=squeeze(uwind6070_avg)
uwind8090_avg=mean(mean(uwind8090,1),2);
uwind8090_avg=squeeze(uwind8090_avg)
dt=(31*60*60*24)-(30*24*60*60);

dudx1=(uwind8090_avg(1:4)-uwind6070_avg(1:4))/dx;
dudx2=(uwind8090_avg(5:8)-uwind6070_avg(5:8))/dx;
dudx3=(uwind8090_avg(9:12)-uwind6070_avg(9:12))/dx;
dudx4=(uwind8090_avg(13:16)-uwind6070_avg(13:16))/dx;
dudx5=(uwind8090_avg(17:20)-uwind6070_avg(17:20))/dx;
dudx=[dudx1 dudx2 dudx3 dudx4 dudx5];
dudx=reshape(dudx,[],1);
ududx60701=uwind6070_avg(1:3).*dudx1(1:3);
ududx60702=uwind6070_avg(5:7).*dudx2(1:3);
ududx60703=uwind6070_avg(9:11).*dudx3(1:3);%only west box
ududx60704=uwind6070_avg(13:15).*dudx4(1:3);
ududx60705=uwind6070_avg(17:19).*dudx5(1:3);
ududx6070=[ududx60701 ududx60702 ududx60703 ududx60704 ududx60705];
ududx6070=reshape(ududx6070,[],1);
%%
dudt60701=diff(uwind6070_avg(1:4)/dt)

dudt60702=diff(uwind6070_avg(5:8)/dt)

dudt60703=diff(uwind6070_avg(9:12)/dt)

dudt60704=diff(uwind6070_avg(13:16)/dt)

dudt60705=diff(uwind6070_avg(17:20)/dt)
dudt6070=[dudt60701 dudt60702 dudt60703 dudt60704 dudt60705]
dudt6070=reshape(dudt6070,[],1)
%%
dudt80901=diff(uwind8090_avg(1:4)/dt)

dudt80902=diff(uwind8090_avg(5:8)/dt)

dudt80903=diff(uwind8090_avg(9:12)/dt)

dudt80904=diff(uwind8090_avg(13:16)/dt)

dudt80905=diff(uwind8090_avg(17:20)/dt)
dudt8090=[dudt80901 dudt80902 dudt80903 dudt80904 dudt80905]
dudt8090=reshape(dudt8090,[],1)
%%
a=corrcoef(pgrad15,dudt6070)
b=corrcoef(pgrad15,dudt8090)
c=corrcoef(ududx6070,dudt6070)
d=corrcoef(ududx6070,dudt8090)