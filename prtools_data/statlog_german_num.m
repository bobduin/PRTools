%STATLOG_GERMAN_NUM Statlog (German Credit Approval, numeric) Data Set 
%PRTools dataset import from UCI, 1000 objects, 24 features, 2 classes
%
%  A = STATLOG_GERMAN_NUM
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(German+Credit+Data)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This is the numeric version of an originally categorical dataset, see
%STATLOG_GERMAN_NUM
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL, STATLOG_GERMAN_NUM

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = statlog_german_num

a = pr_download_uci('Statlog+(German+Credit+Data)','german.data-numeric',[],[],[],[],[],' ');


