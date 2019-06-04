%BALLOONS Psychology experiment conditions
%PRTools UCI dataset import, 20+20+16+16 objects, 4 categorical features, 2 classes
%
%  [A1,A2,A3,A4] = BALLOONS
%   A1_4 = BALLOONS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Balloons">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
% 
%All categorical features are binary and might be used as such in
%routines expecting continuous features.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%DATASETS

function [a1,a2,a3,a4] = balloons

[a1,a2,a3,a4] = pr_download_uci('balloons',{'adult+stretch.data','adult-stretch.data','yellow-small+adult-stretch.data','yellow-small.data'});

if nargout < 2, a1 = [a1;a2;a3;a4];  a1 = setname(a1,'balloons'); end