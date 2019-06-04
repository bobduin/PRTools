%CMC Contraceptive Method Choice
%PRTools dataset import from UCI, 690 objects, 15 mixed features, 2 classes
%
%  A = CMC
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Contraceptive+Method+Choice">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains one categorical features with 4 categories.
%It may be converted to 4 new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = cmc

a = pr_download_uci('Contraceptive+Method+Choice','cmc.data');
a = setfeatdom(a,{char({'1','2','3','4'})},7);


