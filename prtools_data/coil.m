%COIL The COIL images
%
% A = COIL
%
% DESCRIPTION
% 
%
% REFERENCES
% 
%
% LINKS (modify!!)
% <a href="http://algoval.essex.ac.uk/data/sequence/chicken/">Original Dataset</a>
%
% SEE ALSO 
% DATAFILES, SHOW

function a = coil

checklicense_prdatafiles; 

url = 'http://37steps.com/data/prdatafiles/coil.zip';
a = pr_getdata(url,128,'coil','raw',1);
user.desc = '';
a = setuser(a,user);