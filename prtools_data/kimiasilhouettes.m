%KIMIASILHOUETTES Datafile with the KIMIA database of silhouettes
%
% A = KIMIASILHOUETTES
%
% There are 216 binary images, 18 classes with 12 objects each.
% They have variable sizes up to 146 x 156.
% The images are taken from:
% http://www.lems.brown.edu/vision/researchAreas/SIID/
%
% See also DATAFILES

function a = kimiasilhouettes

url = 'http://37steps.com/data/prdatafiles/kimiasilhouettes.zip';
pr_getdata(url,1);
%prdatafiles('kimia_images',1);
labs = {'bone' 'van' 'elephant' 'head' 'fork' 'fountain' ...
	'hammer' 'key' 'ray' 'turtle' 'glass' 'heart' 'misk' ...
	'bird' 'brick' 'camel' 'car' 'children'};
pathname = fileparts(which(mfilename));
a = prdatafile(fullfile(pathname,mfilename));
a = setname(a,'KIMIA silhouettes');
a = setlablist(a,labs);
a = setfeatsize(a,0);
user.desc = ['This database contains a set of silhouettes taken from' ...
		'http://www.lems.brown.edu/vision/researchAreas/SIID/'];
user.link = 'http://www.lems.brown.edu/vision/researchAreas/SIID/';
a = setuser(a,user);
