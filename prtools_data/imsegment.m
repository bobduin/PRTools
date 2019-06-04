%IMSEGMENT Survival of patients after surgery for breast cancer
%PRTools dataset import from UCI, 210+2100 objects, 19 features, 7 classes
%
%  [TRAIN,TEST] = IMSEGMENT
%   TRAIN_TEST  = IMSEGMENT
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Image+Segmentation">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = imsegment

[a,b] = pr_download_uci('Image+Segmentation',{'segmentation.data','segmentation.test'},[],[],[],[5 5],[],[],1);

if nargout < 2, a = [a;b]; a = setname(a,'imsegment'); end
