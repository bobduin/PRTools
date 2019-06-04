%NIST The NIST database of handprinted digits
%
% A = NIST
%
% REFERENCE
% C.L. Wilson, M.D. Marris, Handprinted character database 2, april 1990. 
% National Institute of Standards and Technology; Advanced Systems division.
%
% See also DATAFILES

function a = nist

url = 'http://37steps.com/data/prdatafiles/NIST.zip';
a = pr_getdata(url,10,'Nist','raw',1);

%pathname = fileparts(which(mfilename));
%a = prdatafile(fullfile(pathname,mfilename));
a = setname(a,'NIST Digits');
user.desc = ['This is the NIST database of digits. It consists of 2800 images ' ...
		'for each of the ten classes 0-9. Images have different sizes. '...
		'Consequetive digits may be written by the same person. ' ...
		'A random selection of train and test sets may thereby yield an ' ...
		'optimistically biased performance.'];
a = setuser(a,user);