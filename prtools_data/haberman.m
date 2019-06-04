%HABERMAN Survival of patients after surgery for breast cancer
%PRTools dataset import from UCI, 306 objects, 3 features, 2 classes
%
%  A = HABERMAN
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Haberman's+Survival">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = haberman

a = pr_download_uci('Haberman''s+Survival','haberman.data');


