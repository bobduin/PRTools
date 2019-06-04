%TEACHASSIST Teaching Assistant Evaluation
%PRTools dataset import from UCI, 151 objects, 5 features, 3 classes
%
%  A = TEACHASSIST
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Tic-Tac-Toe+Endgame">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = teachassist

if exist([mfilename('fullpath') '.mat'],'file') == 2 
  s = load([mfilename('fullpath') '.mat']);
  a = s.a;
else
  a = pr_download_uci('Teaching+Assistant+Evaluation','tae.data');
  a = setfeatdom(a,{char([65:89]')},2);
  a = setfeatdom(a,{char([65:90]')},3);
  a = setlablist(a,char('low','medium','high'));
  save(mfilename('fullpath'),'a');
end



