%ANYDATAFILE
%
% A = ANYDATAFILE(DIR)
%
% DESCRIPTION
% The datafile DIR in the directory of ANYDATAFILE is loaded into A
%
% SEE ALSO DATAFILES

function a = anydatafile(name)

pathname = fileparts(which(mfilename));
a = datafile(fullfile(pathname,name));