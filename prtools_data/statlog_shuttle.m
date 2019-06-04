%STATLOG_SHUTTLE Statlog (Shuttle) Data Set  
%PRTools dataset import from UCI, 43500+14500 objects, 9 features, 7 classes
%
%  [TRAIN,TEST] = STATLOG_SHUTTLE
%   TRAIN_TEST  = STATLOG_SHUTTLE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(Shuttle)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = statlog_shuttle

url1 = 'http://37steps.com/data/prdatasets/shuttle.zip';
url2 = 'http://37steps.com/data/prdatasets/shuttle.tst';
[a,b] = pr_download_uci('Statlog+(Shuttle)',{url1,url2},[],[],[],[],[],' ');
if nargout < 2, a = [a;b];  a = setname(a,'statlog_shuttle'); end
