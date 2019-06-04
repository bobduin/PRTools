%SPECTROMETER Part of the IRAS Low Resolution Spectrometer Database
%PRTools UCI dataset import, 531 objects, 101 integer features, 10 classes
%
%  A = SPECTROMETER
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Low+Resolution+Spectrometer">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%Refer to the dataset documentation before using this routine. The  
%attributes 1 and 2 are removed (LRS name and LRS class). Consequently
%featues 1-8 contain header information, feature 9-52 the blue band and
%feature 53-101 the red band. 
%
%Just the basic classes are used as class labels (floor of attribute_2/10).
%There are five classes with a very few objects (1 2 6 7 and 6 objects).
%Remove them by A = REMCLASS(A,N) with, e.g., N = 7.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, REMCLASS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = spectrometer

name = 'spectrometer';
if exist([mfilename('fullpath') '.mat'],'file') == 2 
  s = load([mfilename('fullpath') '.mat']);
  a = s.a;
else
  a = pr_download_uci('Low+Resolution+Spectrometer','lrs.data');
  % the dat-file is irregularly formatted, so we hae to redo parsing
  fid = fopen([mfilename('fullpath') '.dat']);
  m = 531;
  lrsnames = cell(1,m);
  labs = zeros(m,1);
  data = zeros(m,101);
  for j=1:m
    lrsnames{j} = fscanf(fid,'( %s',1);
    labs(j) = fscanf(fid,'%i',1);
    data(j,:) = fscanf(fid,'%e',101);
    fscanf(fid,'%c',3);
  end
  labs = floor(labs/10);
  a = prdataset(data,labs);
  save(mfilename('fullpath'),'a');
end
a = setname(a,name);




