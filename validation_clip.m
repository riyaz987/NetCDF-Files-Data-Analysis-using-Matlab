file='access_obs_tas.nc'
lon=ncread(file,'lon');
lat=ncread(file,'lat');
a=ncread(file,'t2m');
time=ncread(file,'expver');

dt=datevec(time+datenum('1900-01-01'));

%%
clear all
clc

%%
file='tas_Amon_UKESM1-0-LL_ssp245_r1i1p1f2_gn_201501-204912.nc'
lon=ncread(file,'lon');
lat=ncread(file,'lat');
lon1=lon(33:54);
lat1=lat(76:105);
%%
a=shaperead('INDIA.shp');

[ln,lt]=meshgrid(lon1,lat1);

ln1=[a.X];
lt1=[a.Y];


in=inpolygon(ln,lt,ln1,lt1);
%%
mask=nan(size(ln));
mask(in)=0;
%%
nc_files_covid=dir('tas*.nc');
nfiles_covid=length(nc_files_covid);

for i =1:1:nfiles_covid
    
    tascovid(:,:,:,i)=ncread(nc_files_covid(i).name,'tas');
   
    clip_tascovid(:,:,:,i)=tascovid(33:54,76:105,1:60,i);
    
 
end

%%
clip_mean=mean(clip_tascovid,4);
%%
for i=1:1:60
tas_ukesm_validation(:,:,i)=(clip_mean(:,:,i)+mask');
end
%%
save('tas_ukesm_validation.mat');