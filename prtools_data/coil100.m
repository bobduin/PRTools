%COIL100 The COIL100 images
%
% A = COIL100
%
% DESCRIPTION
% COIL100 is a database of color images of objects. The objects were placed
% on a motorized turntable against a black background. The turntable was
% rotated through degrees to vary object pose with respect to a fixed color
% camera. Images of the objects were taken at pose intervals of 5 degrees.
% This corresponds to 72 poses per object. The images were size normalized
% and processed (background discarded).
%
% REFERENCE
% S.A.Nene, S.K.Nayar and H. Murase, Columbia Object Image Library
% (COIL-100), Technical Report No. CUCS-006-96, Dept. of Comp. Science,
% Columbia University, N.Y., USA, 1996.
%
% LINK
% <a href="http://www1.cs.columbia.edu/CAVE/software/softlib/coil-100.php">Original Dataset</a>
%
% SEE ALSO 
% DATAFILES, SHOW

function a = coil100

checklicense_prdatafiles; 

url = 'http://37steps.com/data/prdatafiles/Coil100.zip';
a = pr_getdata(url,128,'Coil100','raw',1);
user.desc = ['COIL100 is a database of color images of objects. ' ...
  'The objects were placed on a motorized turntable against a black background. ' ...
  'The turntable was rotated through degrees to vary object pose with respect ' ...
  'to a fixed color camera. Images of the objects were taken at pose intervals ' ...
  'of 5 degrees. This corresponds to 72 poses per object. ' ...
  'The images were size normalized and processed (background discarded).'];
user.link = {'Original Dataset','http://www1.cs.columbia.edu/CAVE/software/softlib/coil-100.php'};
user.ref = {['S.A.Nene, S.K.Nayar and H. Murase, Columbia Object Image Library ' ...
'(COIL-100), Technical Report No. CUCS-006-96, Dept. of Comp. Science, ' ...
'Columbia University, N.Y., USA']};
a = setuser(a,user);