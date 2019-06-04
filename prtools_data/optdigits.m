%OPTDIGITS Optical Recognition of Handwritten Digits
%PRTools UCI dataset import, 3823+1797 objects, 64 integer features, 10 classes
%
%  [TRAIN,TEST] = OPTDIGITS
%   TRAIN_TEST  = OPTDIGITS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Optical+Recognition+of+Handwritten+Digits">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = optdigits

[a,b] = pr_download_uci('Optical+Recognition+of+Handwritten+Digits',{'optdigits.tra','optdigits.tes'});

if nargout < 2, a = [a;b]; a = setname(a,'optdigits'); end



