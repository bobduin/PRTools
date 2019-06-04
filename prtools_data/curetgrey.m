%CURETGREY The CURETGREY database of grey textures
%
% A = CURETGREY
%
% See also DATAFILES

function a = curetgrey

pathname = fileparts(which(mfilename));
a = datafile(fullfile(pathname,mfilename));
a = setname(a,'Curetgrey');