%%
%covid
nc_files_covid=dir('tas_Amon_CanESM5*.nc');
nfiles_covid=length(nc_files_covid);

for i =1:1:nfiles_covid
    tascovid(:,:,:,i)=ncread(nc_files_covid(i).name,'tas');
   
    clip_tascovid_mean(:,:)=mean(tascovid(22:37,33:47,1:72,i),[3 4]);
    clip_tascovid_std(:,:)=std(tascovid(22:37,33:47,1:72,i),0,[3 4]);
end
%%
%control
nc_files_control=dir('tas_Amon_CanESM5*.nc');
nfiles_control=length(nc_files_control);

for i =1:1:nfiles_control
    tascontrol(:,:,:,i)=ncread(nc_files_control(i).name,'tas');
   
    clip_tascontrol_mean(:,:)=mean(tascontrol(22:37,33:47,1:72,i),[3 4]);
    clip_tascontrol_std(:,:)=std(tascontrol(22:37,33:47,1:72,i),0,[3 4]);
end
%%
mean_temp_res=(clip_tascovid_mean-clip_tascontrol_mean);
std_temp_res=(clip_tascovid_std-clip_tascontrol_std);

%%
lon2=lon1(22:37);
lat2=lat1(33:47);
pcolor(lon2,lat2,mean_temp_res'); shading flat; colorbar 
a=[5   48   97
 33  102  172
 67  147  195
146  197  222
209  229  240
247  247  247
254  219  199
244  165  130
214   96   77
178   24   43
103    0   31
]/255
colormap(a)
caxis([-1 1])
borders('countries','k','linewidth',2)
cb=colorbar;
cb.Label.String='Temperature (in ^oC)';
hold on
[M,c]=contour(lon2,lat2,std_temp_res','--','ShowText','on');
c.LineWidth = 2;

title('Ensemble Mean SAT 2020-2025')
xlabel('Longitude');
ylabel('Latitude');

set(gca,'linewidth',3,'fontsize',30)





%%
temp_file='5.nc';
time=ncread(temp_file,'time');

%pvt_dt=datenum('1850-01-01 0:0:0.0');
% number of days between matlab start date data start date based on 365
% days year 
NumDays = days365('01-jan-0','01-jan-1850'); 

% add number of days to the time 
tt=datenum(time+NumDays);
% converting dates to vectors based on 365 days year 
dt=noLeapDateVec(tt);
lat1=ncread('tas_Amon_CanESM5_ssp245-covid_r1i1p1f1_gn_202001-205012.nc','lat');
lon1=ncread('tas_Amon_CanESM5_ssp245-covid_r1i1p1f1_gn_202001-205012.nc','lon');
%%
file1=ncread('1.nc','tas');
file2=ncread('2.nc','tas');
file3=ncread('3.nc','tas');
file4=ncread('4.nc','tas');
file5=ncread('5.nc','tas');
file6=ncread('6.nc','tas');
file7=ncread('7.nc','tas');
file8=ncread('8.nc','tas');
file9=ncread('9.nc','tas');
file10=ncread('10.nc','tas');
file11=ncread('11.nc','tas');
file12=ncread('12.nc','tas');
file13=ncread('13.nc','tas');
file14=ncread('14.nc','tas');
file15=ncread('15.nc','tas');
file16=ncread('16.nc','tas');
file17=ncread('17.nc','tas');
file18=ncread('18.nc','tas');
file19=ncread('19.nc','tas');
file20=ncread('20.nc','tas');
file21=ncread('21.nc','tas');
file22=ncread('22.nc','tas');
file23=ncread('23.nc','tas');
file24=ncread('24.nc','tas');
file25=ncread('25.nc','tas');
file26=ncread('26.nc','tas');
file27=ncread('27.nc','tas');
file28=ncread('28.nc','tas');
file29=ncread('29.nc','tas');
file30=ncread('30.nc','tas');
file31=ncread('31.nc','tas');
file32=ncread('32.nc','tas');
file33=ncread('33.nc','tas');
file34=ncread('34.nc','tas');
file35=ncread('35.nc','tas');
file36=ncread('36.nc','tas');
file37=ncread('37.nc','tas');
file38=ncread('38.nc','tas');
file39=ncread('39.nc','tas');
file40=ncread('40.nc','tas');
file41=ncread('41.nc','tas');
file42=ncread('42.nc','tas');
file43=ncread('43.nc','tas');
file44=ncread('44.nc','tas');
file45=ncread('45.nc','tas');
file46=ncread('45.nc','tas');
file47=ncread('47.nc','tas');
file48=ncread('48.nc','tas');
file49=ncread('49.nc','tas');
file50=ncread('50.nc','tas');
%%
A1=mean(file1(:,:,1:12),3);
A1=(A1-273.15);

A2=mean(file2(:,:,1:12),3);
A2=(A2-273.15);

A3=mean(file3(:,:,1:12),3);
A3=(A3-273.15);

A4=mean(file4(:,:,1:12),3);
A4=(A4-273.15);

A5=mean(file5(:,:,1:12),3);
A5=(A5-273.15);

A6=mean(file6(:,:,1:12),3);
A6=(A6-273.15);

A7=mean(file7(:,:,1:12),3);
A7=(A7-273.15);

A8=mean(file8(:,:,1:12),3);
A8=(A8-273.15);

A9=mean(file9(:,:,1:12),3);
A9=(A9-273.15);

A10=mean(file10(:,:,1:12),3);
A10=(A10-273.15);

A11=mean(file11(:,:,1:12),3);
A11=(A11-273.15);

A12=mean(file12(:,:,1:12),3);
A12=(A12-273.15);

A13=mean(file13(:,:,1:12),3);
A13=(A13-273.15);

A14=mean(file14(:,:,1:12),3);
A14=(A14-273.15);

A15=mean(file15(:,:,1:12),3);
A15=(A15-273.15);

A16=mean(file16(:,:,1:12),3);
A16=(A16-273.15);

A17=mean(file17(:,:,1:12),3);
A17=(A17-273.15);

A18=mean(file18(:,:,1:12),3);
A18=(A18-273.15);

A19=mean(file19(:,:,1:12),3);
A19=(A19-273.15);

A20=mean(file20(:,:,1:12),3);
A20=(A20-273.15);

A21=mean(file21(:,:,1:12),3);
A21=(A21-273.15);

A22=mean(file22(:,:,1:12),3);
A22=(A22-273.15);

A23=mean(file23(:,:,1:12),3);
A23=(A23-273.15);

A24=mean(file24(:,:,1:12),3);
A24=(A24-273.15);

A25=mean(file25(:,:,1:12),3);
A25=(A25-273.15);

A26=mean(file26(:,:,1:12),3);
A26=(A26-273.15);

A27=mean(file27(:,:,1:12),3);
A27=(A27-273.15);

A28=mean(file28(:,:,1:12),3);
A28=(A28-273.15);

A29=mean(file29(:,:,1:12),3);
A29=(A29-273.15);

A30=mean(file30(:,:,1:12),3);
A30=(A30-273.15);

A31=mean(file31(:,:,1:12),3);
A31=(A31-273.15);

A32=mean(file32(:,:,1:12),3);
A32=(A32-273.15);

A33=mean(file33(:,:,1:12),3);
A33=(A33-273.15);

A34=mean(file34(:,:,1:12),3);
A34=(A34-273.15);

A35=mean(file35(:,:,1:12),3);
A35=(A35-273.15);

A36=mean(file36(:,:,1:12),3);
A36=(A36-273.15);

A37=mean(file37(:,:,1:12),3);
A37=(A37-273.15);

A38=mean(file38(:,:,1:12),3);
A38=(A38-273.15);

A39=mean(file39(:,:,1:12),3);
A39=(A39-273.15);

A40=mean(file40(:,:,1:12),3);
A40=(A40-273.15);

A41=mean(file41(:,:,1:12),3);
A41=(A41-273.15);

A42=mean(file42(:,:,1:12),3);
A42=(A42-273.15);

A43=mean(file43(:,:,1:12),3);
A43=(A43-273.15);

A44=mean(file44(:,:,1:12),3);
A44=(A44-273.15);

A45=mean(file45(:,:,1:12),3);
A45=(A45-273.15);

A46=mean(file46(:,:,1:12),3);
A46=(A46-273.15);

A47=mean(file47(:,:,1:12),3);
A47=(A47-273.15);

A48=mean(file48(:,:,1:12),3);
A48=(A48-273.15);

A49=mean(file49(:,:,1:12),3);
A49=(A49-273.15);

A50=mean(file50(:,:,1:12),3);
A50=(A50-273.15);
%%

ensemble=cat(3,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,A15,A16,A17,A18,A19,A20,A21,A22,A23,A24,A25,A26,A27,A28,A29,A30,A31,A32,A33,A34,A35,A36,A37,A38,A39,A40,A41,A42,A43,A44,A45,A46,A47,A48,A49,A50);

%%
mean_ensemble=mean(ensemble,3);

%%
std_ensemble=std(ensemble,0,3);

%%
pcolor(lon1(22:37),lat1(33:47),mean_ensemble(22:37,33:47)'); shading flat; colorbar 
colormap jet
caxis([-10 30])
borders('countries','k','linewidth',2)
cb=colorbar;
cb.Label.String='Temperature (in ^oC)';
hold on
[M,c]=contour(lon1(22:37),lat1(33:47),std_ensemble(22:37,33:47)','--','ShowText','on');
c.LineWidth = 2;

title('Ensemble Mean SAT 2020')
xlabel('Longitude');
ylabel('Latitude');

set(gca,'linewidth',3,'fontsize',30)