%ANNEALING Steel annealing data
%PRTools UCI dataset import, 798+100 objects, 38 features, 2 classes
%
%  [TRAIN,TEST] = ANNEALING(VAL)
%   TRAIN_TEST  = ANNEALING(VAL)
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Annealing">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%Dataset has missing values. By default all features with missing values are
%removed. Use VAL=NaN to avoid this. For other options see MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL, MISVAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function varargout = annealing(val)

if nargin<1
	val = 'f-remove';
end

varargout = cell(1,nargout);
[varargout{:}] = loadmatfile;
if isempty(varargout{1})
  opt.format  = 'cccnncccncccccccccccccccccccccccnnncncc';
  %opt.matfile = false; % we save the datasets below
  [varargout{:}] =  pr_download_uci('annealing',{'anneal.data','anneal.test'},opt);
end
varargout = varargout*misval(val);



