%MAMMOGRAPHIC_MASS MAGIC Discrimination of benign and malignant mammographic masses
%PRTools dataset import from UCI, 961 objects, 5 features, 2 classes
%
%  A = MAMMOGRAPHIC_MASS
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Mammographic+Mass">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%There are missing values, coded by NaNs. They may be handled by MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, MISVAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = mammographic_mass

a = pr_download_uci('Mammographic+Mass','mammographic_masses.data');

