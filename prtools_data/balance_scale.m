%BALANCE_SCALE Balance scale weight & distance database
%PRTools UCI dataset import, 625 objects, 4 mixed features, 5 classes
%
%  A = BALANCE_SCALE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Balance+Scale">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains one categorical features with 3 categories.
%It may be converted to 3 new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = balance_scale

a = pr_download_uci('Balance+Scale','balance-scale.data');


