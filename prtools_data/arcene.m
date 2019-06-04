%ARCENE Cancer recognition based on mass spectra
%PRTools UCI dataset import, 100+100+700 objects, 10000 features, 2 classes
%
%  [TRAIN,VALID,TEST] = ARCENE
%   TRAIN_VALID  = ARCENE
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Arcene">related website</a>.
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%The training set (100 objects) and the validation set (100 objects) are
%labeled. The test set (700 objects) is unlabeled. The order of the 
%original feature (spectral bands) is randomized. Moreover, the set is
%merged with a large number of random features. See the dataset <a href="http://archive.ics.uci.edu/ml/datasets/Arcene">website</a>.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b,c] = arcene

datfiles = {'ARCENE/arcene_train.data','ARCENE/arcene_valid.data','ARCENE/arcene_test.data'};
labfiles = {'ARCENE/arcene_train.labels','arcene_valid.labels',0};
[a,b,c] = pr_download_uci('Arcene',datfiles,[],[],[3,3,18],[],[],' ',labfiles);
c = setlablist(c,[]);

if nargout < 2
  a = [a;b]; 
  a = setname(a,'arcene'); 
end



