%ISOLET Spoken letter names
%PRTools dataset import from UCI, 6238+1559 objects, 617 categorical features, 26 classes
%
%  [TRAIN,TEST] = ISOLET
%   TRAIN_TEST  = ISOLET
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/ISOLET">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function [a,b] = isolet

% UCI data is Z-compressed. No Matlab command found for uncompressing.
% Load zipped data from 37steps.
url1 = 'http://37steps.com/data/prdatasets/isolet1+2+3+4.zip';
url2 = 'http://37steps.com/data/prdatasets/isolet5.zip';
[a,b] = pr_download_uci('ISOLET',{url1,url2});
if nargout < 2, a = [a;b];  a = setname(a,'isolet'); end

