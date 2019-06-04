%STATLOG_AUSTRALIAN Statlog (Australian Credit Approval) Data Set 
%PRTools dataset import from UCI, 690 objects, 14 features, 2 classes
%
%  A = STATLOG_AUSTRALIAN
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Statlog+(Australian+Credit+Approval)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = statlog_australian

a = pr_download_uci('Statlog+(Australian+Credit+Approval)','australian.dat',[],[],[],[],[],' ');
a(:,[1 8 9 11]) = a(:,[1 8 9 11]) + 1;
domains = {char('a','b'), ...
           char('p','g','gg'), ...
           char('ff','d','i','k','j','aa','m','c','w','e','q','r','cc','x'), ....
           char('ff','dd','j','bb','v','n','o','h','z'), ...
           char('f','t'), ...
           char('f','t'), ...
           char('f','t'), ...
           char('s','g','p')};
a = setfeatdom(a,domains,[1,4,5,6,8,9,11,12]);


