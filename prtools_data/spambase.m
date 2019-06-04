%SPAMBASE spam e-mail database 
%PRTools dataset import from UCI, 4601 objects, 57 features, 2 classes
%
%  A = SPAMBASE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Spambase">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%There are no missing values found in the dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = spambase

a = pr_download_uci('spambase');


