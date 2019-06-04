%IRASSPECTRA Pen-based recognition of handwritten digits
%PRTools dataset import from UCI, 531 objects, 101 features, 9 classes
%
%  A = IRASSPECTRA
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Low+Resolution+Spectrometer">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function a = irasspectra

b = pr_download_uci('Low+Resolution+Spectrometer','lrs.data');
if size(b,1) ~= 531
  % nor proper mat-file yet, construct it from irregular dat-file
  fid = fopen('irasspectra.dat');
  s = fread(fid);
  s([s==40 | s==41 | s==10]) = [];
  t = textscan(char(s'),['%s' repmat('%n',1,102)]);
  a = prdataset([t{3:end}],ceil(t{2}/10));
  a = setname(a,getname(b));
  a = setuser(a,getuser(b,'data'),'data');
  save(fullfile(fileparts(which(mfilename)),'irasspectra.mat'),'a');
  fclose(fid);
else
  a = b;
end