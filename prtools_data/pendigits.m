%PENDIGITS Pen-based recognition of handwritten digits
%PRTools dataset import from UCI, 7494+3498 objects, 16 features, 10 classes
%
%  [TRAIN,TEST] = PENDIGITS
%   TRAIN_TEST  = PENDIGITS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Pen-Based+Recognition+of+Handwritten+Digits">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function [a,b] = pendigits

[a,b] = pr_download_uci('Pen-Based+Recognition+of+Handwritten+Digits',{'pendigits.tra','pendigits.tes'});

if nargout < 2, a = [a;b]; a = setname(a,'pendigits'); end
