%Test on dydadic operations
%Need: prtools, prdatasets, prdatafiles

prdatasets('kimia');
prdatafiles('kimia_images');

a = kimia;
x = selclass(a,7);
y = selclass(a,11);

delfigs
s = 'z = x+y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x-y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = -x+y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x&y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x|y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = ~x&(~y)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x./(y+1)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = '(x+1).*(y+2)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = 2*x+3*y+1'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x/2 + y/3'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x<y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x<=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x>y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x>=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x~=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);
s = 'z = x==y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(40,:)); title(s);

showfigs

disp('Waiting for ''return'''); pause

a = kimia_images;
x = selclass(a,1);
if isoctave
  y = x*filtm([],'bwmorph',{'erode',7})*filtm([],'bwmorph',{'dilate',7});
else
  y = x*dipbin([],'berosion',7)*dipbin([],'bdilation',7);
end

delfigs

show(y*63);

disp('Waiting for ''return'''); pause


delfigs
s = 'z = x+y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x-y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = -x+y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x&y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x|y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = ~x&(~y)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x./(y+1)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = (x+1).*(y+2)'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = 2*x+3*y+1'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x/2 + y/3'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x<y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x<=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x>y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x>=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x~=y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x==y'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);

showfigs

disp('Waiting for ''return'''); pause

a = kimia_images;
b = selclass(a,1);
x = unitm;
if isoctave
  y = x*filtm([],'bwmorph',{'erode',7})*filtm([],'bwmorph',{'dilate',7});
else
  y = x*dipbin([],'berosion',7)*dipbin([],'bdilation',7);
end



delfigs
s = 'z = x+y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x-y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = -x+y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x&y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x|y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = ~x&(~y); z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x./(y+1); z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = (x+1).*(y+2); z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = 2*x+3*y+1; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x/2 + y/3; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x<y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x<=y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x>y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x>=y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x~=y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);
s = 'z = x==y; z=b*z;'; eval(s); figure; show(z); title(s); zim = data2im(z,1); figure; plot(zim(10,:)); title(s);

showfigs

disp('Waiting for ''return'''); pause

a = gendatb;
x = ldc;
y = parzenc;

delfigs

s = 'z = x;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = y;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = x - y;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = -x - 2*y + 3*y - y +2*x;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = x - 2*y + 3*y -x;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = 100*x - 100*y;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = 2*(x/2 - y/2)/3 + y/3;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = x - y - x;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
s = 'z = x/3 - y/2 -y/2 +2*x/3;'; eval(s); z = a*z; figure; scatterd(a); plotc(z); title(s)
showfigs

disp('Waiting for ''return'''); pause

x = a*ldc;
y = a*parzenc;

delfigs

s = 'z = x;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = y;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = x - y;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = -x - 2*y + 3*y - y +2*x;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = x - 2*y + 3*y -x;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = 100*x - 100*y;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = 2*(x/2 - y/2)/3 + y/3;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = x - y - x;'; eval(s); figure; scatterd(a); plotc(z); title(s)
s = 'z = x/3 - y/2 -y/2 +2*x/3;'; eval(s); figure; scatterd(a); plotc(z); title(s)
showfigs


