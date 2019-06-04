%STATLOG_IMSEGMENT Statlog (Image Segmentation) Data Set  
%PRTools dataset import from UCI, 2310 objects, 19 features, 7 classes
%
%  A = STATLOG_IMSEGMENT
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(Image+Segmentation)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset is very similar to the IMSEGMENT dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, IMSEGMENT

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = statlog_imsegment

a = pr_download_uci('Statlog+(Image+Segmentation)','segment.dat',[],[],[],[],[],' ');


