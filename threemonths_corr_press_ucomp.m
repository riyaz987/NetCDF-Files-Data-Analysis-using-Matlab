lon=ncread('Uwind_96-20.nc','longitude');
lat=ncread('Uwind_96-20.nc','latitude');
time=ncread('Uwind_96-20.nc','time');
U=ncread('Uwind_96-20.nc','u');

msl=ncread('msl_96-20.nc','msl');

%%
matdate=((time/24)+datenum(1900,0,0));
matdate=double(matdate);
date= datevec(matdate);
month=date(:,2);
month_3=find(month==5 | month==6 | month==7);

%%
longitude1=(find(lon==60):find(lon==70));
latitude1=lat(1:121);

longitude2=(find(lon==80):find(lon==90));
latitude2=lat(1:121);

%%
P1=msl('longitude1','latitude1',:);
P2=msl('longitude2','latitude2',:);


U1=U('longitude1','latitude1',:);
U2=U('longitude2','latitude2',:);

PT1=msl('longitude1','latitude1',month_3);
PT2=msl('longitude2','latitude2',month_3);

UT1=U('longitude1','latitude1',month_3);
UT2=U('longitude2','latitude2',month_3);
UT11=U('longitude1','latitude1',1:4);
UT12=U('longitude1','latitude1',5:8);
UT13=U('longitude1','latitude1',9:12);
UT14=U('longitude1','latitude1',13:16);
UT15=U('longitude1','latitude1',17:20);

UT21=U('longitude2','latitude2',1:4);
UT22=U('longitude2','latitude2',5:8);
UT23=U('longitude2','latitude2',9:12);
UT24=U('longitude2','latitude2',13:16);
UT25=U('longitude2','latitude2',17:20);

%%
mean_P1=mean(mean(P1));
mean_P2=mean(mean(P2));
mean_P1=squeeze(mean_P1);
mean_P2=squeeze(mean_P2);


mean_U1=mean(mean(U1));
mean_U2=mean(mean(U2));
mean_U1=squeeze(mean_U1);
mean_U2=squeeze(mean_U2);

mean_PT1=mean(mean(PT1));
mean_PT2=mean(mean(PT2));
mean_PT1=squeeze(mean_PT1);
mean_PT2=squeeze(mean_PT2);


mean_UT1=mean(mean(UT1));
mean_UT2=mean(mean(UT2));
mean_UT1=squeeze(mean_UT1);
mean_UT2=squeeze(mean_UT2);


mean_UT11=mean(mean(UT11));
mean_UT11=squeeze(mean_UT11);

mean_UT12=mean(mean(UT12));
mean_UT12=squeeze(mean_UT12);

mean_UT13=mean(mean(UT13));
mean_UT13=squeeze(mean_UT13);

mean_UT14=mean(mean(UT14));
mean_UT14=squeeze(mean_UT14);

mean_UT15=mean(mean(UT15));
mean_UT15=squeeze(mean_UT15);



mean_UT21=mean(mean(UT21));
mean_UT21=squeeze(mean_UT21);

mean_UT22=mean(mean(UT22));
mean_UT22=squeeze(mean_UT22);

mean_UT23=mean(mean(UT23));
mean_UT23=squeeze(mean_UT23);

mean_UT24=mean(mean(UT24));
mean_UT24=squeeze(mean_UT24);

mean_UT25=mean(mean(UT25));
mean_UT25=squeeze(mean_UT25);

%%
%dp/dx=du/dt+u * du/dx
dx=20*1000*110;
dt=(31*24*3600)-(30*24*3600);

dp =(mean_PT2-mean_PT1);
dpX=dp/dx;

du=(mean_UT2-mean_UT1);
duX=du/dx;

Udu1=(mean_UT1.*duX);
Udu2=(mean_UT2.*duX);

duT1=diff(mean_UT11/dt);
duT2=diff(mean_UT12/dt);
duT3=diff(mean_UT13/dt);
duT4=diff(mean_UT14/dt);
duT5=diff(mean_UT15/dt);

duT11=[duT1,duT2,duT3,duT4,duT5];
duT11=reshape(duT11,[],1)

duT11=diff(mean_UT21/dt);
duT22=diff(mean_UT22/dt);
duT33=diff(mean_UT23/dt);
duT44=diff(mean_UT24/dt);
duT55=diff(mean_UT25/dt);

duT12=[duT11,duT22,duT33,duT44,duT55];
duT12=reshape(duT12,[],1)
%%
a=corrcoef(dpX,duT11)
b=corrcoef(duT11,Udu1)
c=corrcoef(dpX,dyT12)
d=corrcoef(duT12,Udu2)
