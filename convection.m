clear all
u=rand(100,100,2);
v=rand(100,100,2);
dz=1;
dx=1;
dy=1;
w=zeros(100,100,2);
    for i=2:100
    w(i,1,1)=0-((u(i,1,1)-u(i-1,1,1))/dx+(v(i,1,1)-v(i,100,1))/dy)/dz;
    end
    for j=2:100
    w(1,j,2)=w(1,j,1)-((u(1,j,2)-u(100,j,2))/dx+(v(1,j,2)-v(1,j-1,2))/dy)/dz;
    end
 
 
 
    for i=2:100
        for j=2:100
            w(i,j,1)=0-((u(i,j,1)-u(i-1,j,1))/dx+(v(i,j,1)-v(i,j-1,1))/dy)/dz;
            w(i,j,2)=w(i,j,1)-((u(i,j,2)-u(i-1,j,2))/dx+(v(i,j,2)-v(i,j-1,2))/dy)/dz;
        end
    end
 
 
s=w(:,:,1);
plot(s)
pcolor(s); colorbar
s1=w(:,:,2);
pcolor(s1); colorbar
