%BRODATZ A high resolution set of Brodatz texture images
%
% A = BRODATZ
%
% DESCRIPTION
% The datafile consists of 89 scanned texture images taken from the Brodatz
% album with resolution 1356x1096 pixels (gratitude to Judith Dijk).
%
% REFERENCE
% P. Brodatz, "Textures: A Photographic Album for Artists and Designers", 
% Dover Publications, New York, 1966.
%
% SEE ALSO
% DATAFILES, SHOW

function a = brodatz

checklicense_prdatafiles; 

url = 'http://37steps.com/data/prdatafiles/Brodatz.zip';
a = pr_getdata(url,110,'Brodatz','raw',1);
user.desc = '89 images';
a = setuser(a,user);