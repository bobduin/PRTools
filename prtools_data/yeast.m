%YEAST Predicting the Cellular Localization Sites of Proteins
%PRTools dataset import from UCI, 1484 objects, 8 features, 10 classes
%
%  A = YEAST
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Yeast">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%The sequence names are stored as a second label list (see ADDLABELS) under
%the name 'sequence'.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = yeast

a = pr_download_uci('yeast',[],[],[],[],[],[],' ');
a = feat2lab(a,1,'sequence');

