%ZOO Animal recognition by boolean features
%PRTools UCI dataset import, 101 objects, 16 features, 7 classes
%
%  A = ZOO
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Zoo">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%The animal names can be retrieved by GETIDENT(A,'animal').
%The feature names can be retrieved by GETFEATLAB(A).
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, GETIDENT, GETFEATLAB

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = zoo

a = pr_download_uci('Zoo');

f = dset2cell(a,1);
a = setident(a(:,2:end),f,'animal');

featlab = {'hair','feathers','eggs','milk','airborne','aquatic', ...
  'predator','toothed','backbone','breathes','venomous','fins','legs', ...
  'tail','domestic','catsize'};
a = setfeatlab(a,featlab);
