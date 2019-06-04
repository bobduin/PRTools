%STATLOG_SATELLITE Statlog (Landsat Satellite) Data Set 
%PRTools dataset import from UCI, 4435+2000 objects, 36 features, 6 classes
%
%  [TRAIN,TEST] = STATLOG_SATELLITE
%   TRAIN_TEST  = STATLOG_SATELLITE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(Landsat+Satellite)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset is identical to the SATELLITE dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SATELLITE

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = statlog_satellite

[a,b] = pr_download_uci('Statlog+(Landsat+Satellite)',{'sat.trn','sat.tst'},[],[],[],[],[],' ');

if nargout < 2, a = [a;b]; a = setname(a,'statlog_satellite'); end
