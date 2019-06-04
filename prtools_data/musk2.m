%MUSK2 Prediction of molecules to be musks or non-musks
%PRTools dataset import from UCI, 6598 objects, 166 features, 2 classes
%
%  A = MUSK2
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Musk+(Version+2)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%A is a multiple-instance dataset. The objects are the instances. They
%group in 102 bags. There are two labels: (1) the Bag Label and (2) the Bag
%Index. Use the CHANGELABLIST command to change from labeling system. See
%also MULTI_LABELING
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%DATASETS, MULTI_LABELING, CHANGELABLIST

function a = musk2

% UCI data is Z-compressed. No Matlab command foud for uncompressing.
% Load zipped data from 37steps.
a = pr_download_uci('Musk+(Version+2)','http://37steps.com/data/prdatasets/musk2.zip',[],[],5);
a = setlablistnames(a,'Bag Label',1);
a = feat2lab(a,1,'Bag Index');
a(:,2) = [];