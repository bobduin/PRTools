%CONNECT4 Connect-4 game positions
%PRTools dataset import from UCI, 67557 objects, 42 categorical features, 3 classes
%
%  A = CONNECT4
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Connect-4">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = connect4

% UCI data is Z-compressed. No Matlab command foud for uncompressing.
% Load uncompressed data from 37steps.
a = pr_download_uci('Connect-4','http://37steps.com/data/prdatasets/connect-4.data',[],[],6);


