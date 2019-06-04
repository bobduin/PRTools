%OBJECTCATEGORIES101 Image database of objects
%
%  A = OBJECTCATEGORIES101
%
% Loads a datafile of 9197 images of 102 classes. See
%   L. Fei-Fei, R. Fergus, and P. Perona. 
%   Learning generative visual models from few training examples: 
%   an incremental Bayesian approach tested on 101 object categories. 
%   In Proc. of the Workshop on Generative-Model Based Vision. Washington, 
%   DC, June 2004. 
%
% LINK: http://pascallin.ecs.soton.ac.uk/challenges/VOC/databases.html#101
%
% See also PRDATAFILES

function a = objectcategories101
url = 'http:\\37steps.com\data\prdatafiles\101objectcategories.zip';
size = 950;
name = '101objectcategories';
pathname = fileparts(which(mfilename));
a = prdatafiles(pathname,'objectcategories101',size,url);
a = setname(a);