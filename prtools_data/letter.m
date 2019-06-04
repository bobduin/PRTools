%LETTER Predict the age of abalone from physical measurements
%PRTools dataset import from UCI, 4177 objects, 8 features, 28 classes
%
%  A = LETTER
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Letter+Recognition">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>

function a = letter

a = pr_download_uci('Letter+Recognition','letter-recognition.data');


