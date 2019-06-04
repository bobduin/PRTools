%CENSUS_INCOME Weighted census data
%PRTools UCI dataset import, 199523+99762 objects, 41 mixed features, 2 classes
%
%  [TRAIN,TEST,ALL] = CENSUS_INCOME(VAL)
%   TRAIN_TEST  = CENSUS_INCOME(VAL)
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Census-Income+(KDD)">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%Dataset has missing values. By default all objects with missing values are
%removed. Use VAL=NaN to avoid this. For other options see MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL, MISVAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function varargout = census_income(val)

if nargin<1
	val = 'remove';
end

varargout = cell(1,nargout);
[varargout{:}] = loadmatfile;
if isempty(varargout{1})
  opt.format = 'ncnncnccccccccccnnncccccncccccncccccncnnnc';
  opt1.size  = 6;
  opt2.size  = 3;
  % no matfiles found, create them
  [varargout{:}] = pr_download_uci('Census-Income+(KDD)',{'census-income.data.gz','census-income.test.gz'},{opt1,opt2,opt});
end
varargout = varargout*misval(val);



