%SPECTF Single Proton Emission Computed Tomography  heart data
%PRTools UCI dataset import, 80+187 objects, 44 features, 2 classes
%
%  [TRAIN,TEST] = SPECTF
%   TRAIN_TEST  = SPECTF
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS 

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = spectf

[a,b] = pr_download_uci('SPECTF+Heart',{'SPECTF.train','SPECTF.test'},[],[],[],[],[],[],1);

if nargout < 2, a = [a;b]; a = setname(a,'spectf'); end



