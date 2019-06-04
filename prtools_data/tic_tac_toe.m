%TIC_TAC_TOE Teaching Assistant Evaluation
%PRTools dataset import from UCI, 958 objects, 9 features, 2 classes
%
%  A = TIC_TAC_TOE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = tic_tac_toe

a = pr_download_uci('Tic-Tac-Toe+Endgame','tic-tac-toe.data');



