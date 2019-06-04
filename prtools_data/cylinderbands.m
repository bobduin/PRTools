%CYLINDERBANDS mitigating process delays in rotogravure printing
%PRTools dataset import from UCI, 541 objects, 39 features, 2 classes
%
%  A = CYLINDERBANDS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Cylinder+Bands">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%There are missing values, coded by NaNs. They may be handled by MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, MISVAL, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = cylinderbands

% UCI dataset is irregulary formatted.
% Load modified data from 37steps.
a = pr_download_uci('Cylinder+Bands','http://37steps.com/data/prdatasets/cylinderbands.dat');
