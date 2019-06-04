%STATLOG_HEART Statlog (Heart) Data Set 
%PRTools dataset import from UCI, 270 objects, 13 features, 2 classes
%
%  A = STATLOG_GERMAN
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(Heart)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = statlog_heart

a = pr_download_uci('Statlog+(Heart)','heart.dat',[],[],[],[],[],' ');


