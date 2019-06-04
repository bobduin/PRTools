%AUDIOLOGY Standardized audiology dataset
%PRTools dataset import from UCI, 200+26 objects, 70 nominal features, 6 classes
%
%  [TRAIN,TEST] = AUDIOLOGY(VAL)
%   TRAIN_TEST  = AUDIOLOGY(VAL_
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Audiology+%28Standardized%29">related website</a>
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

function varargout = audiology(val)

if nargin<1
	val = 'f-remove';
end

varargout = cell(1,nargout);
[varargout{:}] = loadmatfile;
if isempty(varargout{1})
  % no matfiles found, create them
  [varargout{:}] = pr_download_uci('Audiology+(Standardized)',{'audiology.standardized.data','audiology.standardized.test'});
end
varargout = varargout*misval(val);

