access_anomaly=(access_aod_covid-access_aod_control);
canesm_anomaly=(canesm_aod_covid-canesm_aod_control);
cesm2_anomaly=(cesm2_aod_covid-cesm2_aod_control);
giss_anomaly=(giss_aod_covid-giss_aod_control);
miroc_anomaly=(miroc_aod_covid-miroc_aod_control);
mpi_anomaly=(mpi_aod_covid-mpi_aod_control);
mri_anomaly=(mri_aod_covid-mri_aod_control);
noresm_anomaly=(noresm_aod_covid-noresm_aod_control);
ukesm_anomaly=(ukesm_aod_covid-ukesm_aod_control);
%%
p1=(((access_aod_covid-access_aod_control)./access_aod_covid)*100);
p2=(((canesm_aod_covid-canesm_aod_control)./canesm_aod_covid)*100);
p3=(((cesm2_aod_covid-cesm2_aod_control)./cesm2_aod_covid)*100);
p4=(((giss_aod_covid-giss_aod_control)./giss_aod_covid)*100);
p5=(((miroc_aod_covid-miroc_aod_control)./miroc_aod_covid)*100);
p6=(((mpi_aod_covid-mpi_aod_control)./mpi_aod_covid)*100);
p7=(((mri_aod_covid-mri_aod_control)./mri_aod_covid)*100);
p8=(((noresm_aod_covid-noresm_aod_control)./noresm_aod_covid)*100);
p9=(((ukesm_aod_covid-ukesm_aod_control)./ukesm_aod_covid)*100);
%%
%mean for 3 months
access_anomaly_mean=mean(access_anomaly(:,:,3:5),3);
canesm_anomaly_mean=mean(canesm_anomaly(:,:,3:5),3);
cesm2_anomaly_mean=mean(cesm2_anomaly(:,:,3:5),3);
giss_anomaly_mean=mean(giss_anomaly(:,:,3:5),3);
miroc_anomaly_mean=mean(miroc_anomaly(:,:,3:5),3);
mpi_anomaly_mean=mean(mpi_anomaly(:,:,3:5),3);
mri_anomaly_mean=mean(mri_anomaly(:,:,3:5),3);
noresm_anomaly_mean=mean(noresm_anomaly(:,:,3:5),3);
ukesm_anomaly_mean=mean(ukesm_anomaly(:,:,3:5),3);
%%
%percent mean
access_anomaly_mean=mean(p1(:,:,3:5),3);
canesm_anomaly_mean=mean(p2(:,:,3:5),3);
cesm2_anomaly_mean=mean(p3(:,:,3:5),3);
giss_anomaly_mean=mean(p4(:,:,3:5),3);
miroc_anomaly_mean=mean(p5(:,:,3:5),3);
mpi_anomaly_mean=mean(p6(:,:,3:5),3);
mri_anomaly_mean=mean(p7(:,:,3:5),3);
noresm_anomaly_mean=mean(p8(:,:,3:5),3);
ukesm_anomaly_mean=mean(p9(:,:,3:5),3);
%%
s=shaperead('aisa.shp');
%%
subplot(3,3,1)
pcolor(lon_access,lat_access,access_anomaly_mean'); shading interp;colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('ACCESS-ESM1-5')
caxis([-30 30])

hold on
subplot(3,3,2)
pcolor(lon_canesm,lat_canesm,canesm_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('CanESM5')
caxis([-30 30])

hold on
subplot(3,3,3)
pcolor(lon_cesm2,lat_cesm2,cesm2_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('CESM2')
caxis([-30 30])

hold on
subplot(3,3,4)
pcolor(lon_giss,lat_giss,giss_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('GISS-E2-1-G')
caxis([-30 30])

hold on
subplot(3,3,5)
pcolor(lon_miroc,lat_miroc,miroc_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('MIROC-ES2L')
caxis([-30 30])

hold on
subplot(3,3,6)
pcolor(lon_mpi,lat_mpi,mpi_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('MPI-ESM1-2-LR')
caxis([-30 30])

hold on
subplot(3,3,7)
pcolor(lon_mri,lat_mri,mri_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('MRI-ESM2-0')
caxis([-30 30])

hold on
subplot(3,3,8)
pcolor(lon_ukesm,lat_ukesm,ukesm_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('UKESM1-0-LL')
caxis([-30 30])

hold on
subplot(3,3,9)
pcolor(lon_noresm,lat_noresm,noresm_anomaly_mean'); shading interp; colorbar
hold on
plot([s.X],[s.Y],'k','linewidth',2);
title('NorESM2-LM')
caxis([-30 30])

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
cb=colorbar;

%%
a=shaperead('INDIA.shp');


%%

    [ln,lt]=meshgrid(lon_ukesm,lat_ukesm);

    ln1=[a.X];
    lt1=[a.Y];

    in=inpolygon(ln,lt,ln1,lt1);

    mask=nan(size(ln));
    mask(in)=0;

    mask_ukesm(:,:)=(ukesm_anomaly_mean(:,:)+mask');

    clear ln lt ln1 lt1 mask in


%%
mean_access=nanmean(mask_access,'all');
mean_canesm=nanmean(mask_canesm,'all');
mean_cesm2=nanmean(mask_cesm2,'all');
mean_giss=nanmean(mask_giss,'all');
mean_miroc=nanmean(mask_miroc,'all');
mean_mpi=nanmean(mask_mpi,'all');
mean_mri=nanmean(mask_mri,'all');
mean_noresm=nanmean(mask_noresm,'all');
mean_ukesm=nanmean(mask_ukesm,'all');
%%
std_access=nanstd(mask_access,0,'all');
std_canesm=nanstd(mask_canesm,0,'all');
std_cesm2=nanstd(mask_cesm2,0,'all');
std_giss=nanstd(mask_giss,0,'all');
std_miroc=nanstd(mask_miroc,0,'all');
std_mpi=nanstd(mask_mpi,0,'all');
std_mri=nanstd(mask_mri,0,'all');
std_noresm=nanstd(mask_noresm,0,'all');
std_ukesm=nanstd(mask_ukesm,0,'all');
%%
a=cat(1,mean_access,mean_canesm,mean_cesm2,mean_giss,mean_miroc,mean_mpi,mean_mri,mean_noresm,mean_ukesm);
b=cat(1,std_access,std_canesm,std_cesm2,std_giss,std_miroc,std_mpi,std_mri,std_noresm,std_ukesm);
y=bar(a)
hold on 
x=errorbar(a,b,'vertical', 'LineStyle', 'none')
x.Color = [0 0 0];   

x.LineWidth=1
xticklabels({'ACCESS-ESM1-5','CanESM5','CESM2','GISS-E2-1-G','MIROC-ES2L','MPI-ESM1-2-LR','MRI-ESM2-0','NorESM2-LM','UKESM1-0-LL'});
xt = get(gca, 'XTick');

title('AOD 2020 Anomaly Mean (March, April, May)')
ylabel('Aerosol Optical Depth');
set(gca,'linewidth',2,'fontsize',20)