%MANYOBJECTCATEGORIES Image database of objects
%
%  A = MANYOBJECTCATEGORIES
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
% See also DATAFILES

function a = manyobjectcategories
pathname = fileparts(which(mfilename));
a = datafile('manyobjectcategories');