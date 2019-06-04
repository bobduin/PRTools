%N101OBJECTCATEGORIES Image database of objects
%
%  A = N101OBJECTCATEGORIES
%
% Loads a datafile of 9197 images of 102 classes. See [1].
%   
% REFERENCES
%   L. Fei-Fei, R. Fergus, and P. Perona. 
%   Learning generative visual models from few training examples: 
%   an incremental Bayesian approach tested on 101 object categories. 
%   Proc. Workshop on Generative-Model Based Vision. WashingtonDC, 2004. 
%
% LINK: http://pascallin.ecs.soton.ac.uk/challenges/VOC/databases.html#101
%
% See also PRDATAFILES

function a = n101objectcategories

checklicense_prdatafiles; 

% Datafile information
url = 'http://37steps.com/data/prdatafiles/101ObjectCategories.zip';
size = 950;
user.desc = '9197 images in 102 classes';
user.link = 'http://pascallin.ecs.soton.ac.uk/challenges/VOC/databases.html#101';

% use name from zip-file
[pp,name,ext] = fileparts(url);

% download and decompress if needed
prdatafiles(name,size,url);

% path of prdatafile
pathname = fileparts(which(mfilename));

% create and/or load datafile
a = pr_datafile(fullfile(pathname,name));
a = setuser(x,user);