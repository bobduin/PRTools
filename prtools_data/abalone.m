%ABALONE Predict the age of abalone from physical measurements
%PRTools dataset import from UCI, 4177 objects, 8 features, 28 classes
%
%  A = ABALONE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Abalone">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = abalone

a = pr_download_uci('abalone');
f = textscan('Length	Diam	Height	Whole	Shucked	Viscera	Shell	Rings','%s');
a = setfeatlab(a,f{1});


