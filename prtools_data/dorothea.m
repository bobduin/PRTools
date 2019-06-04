%Dorothea has sparse features: given by indices between 1 and 100000. 
%May be a candidate for datafiles or dissimilarity data?


%DOROTHEA Drug discovery from structural molecular features
%PRTools UCI dataset import, 100+100+700 objects, 10000 features, 2 classes
%
%  [TRAIN,VALID,TEST] = DOROTHEA
%   TRAIN_VALID  = DOROTHEA
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Dorothea">related website</a>.
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

% Copyright: R.P.W. Duin, r.p.w.duin@prtools.org

function [a,b,c] = dorothea

datfiles = {'DOROTHEA/dorothea_train.data','DOROTHEA/dorothea_valid.data','DOROTHEA/dorothea_test.data'};
labfiles = {'DOROTHEA/dorothea_train.labels','dorothea_valid.labels',0};
[a,b,c] = pr_download_uci('Dorothea',datfiles,[],[],[4,2,4],[],[],' ',labfiles);
c = setlablist(c,[]);

if nargout < 2
  a = [a;b]; 
  a = setname(a,'dorothea'); 
end



