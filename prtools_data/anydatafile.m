%ANYDATAFILE
%
% A = ANYDATAFILE
%
% DESCRIPTION
% The datafile DIR in the directory of ANYDATAFILE is loaded into A
%
% REFERENCES
% Some references
%
% LINKS (modify!!)
% <a href="http://algoval.essex.ac.uk/data/sequence/chicken/">Original Dataset</a>
%
% SEE ALSO 
% DATAFILES, SHOW

function a = anydatafile

checklicense_prdatafiles; 

url = 'http://37steps.com/data/prdatafiles/myfile.zip';
a = pr_getdata(url,size,name,'raw',1);
user.desc = '';
a = setuser(a,user);