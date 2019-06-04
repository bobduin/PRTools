%PAGEBLOCKS Page layout blocks
%PRTools dataset import from UCI, 5473 objects, 10 features, 5 classes
%
%  A = PAGEBLOCKS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Page+Blocks+Classification">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function a = pageblocks

% UCI data is Z-compressed. No Matlab command foud for uncompressing.
% Load zipped data from 37steps.
a = pr_download_uci('Page+Blocks+Classification','http://37steps.com/data/prdatasets/page-blocks.zip',[],[],[],[],[],' ');
