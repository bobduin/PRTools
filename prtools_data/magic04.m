%MAGIC04 MAGIC gamma telescope data 2004
%PRTools dataset import from UCI, 19020 objects, 10 features, 2 classes
%
%  A = MAGIC04
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/MAGIC+Gamma+Telescope">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = magic04

a = pr_download_uci('MAGIC+Gamma+Telescope','magic04.data');

