%WAVEFORM1 Waveform Database Generator (Version 1) Data Set
%PRTools dataset import from UCI, 5000 objects, 21 features, 3 classes
%
%  A = WAVEFORM1
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Waveform+Database+Generator+(Version+1)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function [a,b] = waveform1

% UCI data is Z-compressed. No Matlab command found for uncompressing.
% Load zipped data from 37steps.
url = 'http://37steps.com/data/prdatasets/waveform.zip';
a = pr_download_uci('Waveform+Database+Generator+(Version+1)',url);
