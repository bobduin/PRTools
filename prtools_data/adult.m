%ADULT Income exceeding $50K/yr based on census data
%PRTools UCI dataset import, 32561+16281 objects, 14 mixed features, 2 classes
%
%  [TRAIN,TEST] = ADULT(VAL)
%   TRAIN_TEST  = ADULT(VAL)
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Adult">related website</a>
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

function varargout = adult(val)

if nargin<1
	val = 'remove';
end

varargout = cell(1,nargout);
[varargout{:}] = loadmatfile;
if isempty(varargout{1})
  % no matfiles found, create them
  % define settings
  f = textscan('age workclass fnlwgt education education-num martial-status occupation relationship race sex capital-gain capital-loss hours-per-week native-country','%s');
  opt.labfeat     = 15;
  opt.featnames   = f(1);
  opt1.nheadlines = 0;
  opt2.nheadlines = 1;
  opt.matfile     = false; % we save the datasets below

  % download, parse
  [a,b] = pr_download_uci('adult',{'adult.data','adult.test'},{opt1,opt2,opt});
  % classnames of b are wrong
  a = remclass(a);
  b = remclass(b);
  b = setlablist(b,getlablist(a));

  % save separate and combined files
  [varargout{:}] = savematfile(a,b);
  
end

varargout = varargout*misval(val);

