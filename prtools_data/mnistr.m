%MNISTR 70000 normalised digits given by NxN pixels in 10 classes
%
%    [TRAIN,TEST] = MNISTR(N)
%     TRAIN_TEST  = MNISTR(N)
%
% Load the MNIST dataset. These are the original MNIST digits, normalised
% such that they fit exactly in images of NxN pixels. The first 60000 are
% the original training set, the last 10000 are the original test set.
%
% Supported values for N are 2,4,6,8,12,16,20,24,28. Default is the
% original MNIST dataset.
%
% REFERENCE 
% <a href="http://yann.lecun.com/exdb/mnist/" The MNIST website</a>
%
% See also DATASETS, PRDATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function [a,b] = mnistr(n)

if nargin == 0
  name = 'mnist';
  a = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
elseif n == -8
  name = 'mnist8_org';
  a = mnist8;
else
  name = ['mnist' num2str(n)];
  if all(n ~= [2 4 6 8 12 16 20 24 28]);
    error(['Dataset ' name ' not available'])
  end
  a = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
end
if nargout == 2
  b = a(60001:end,:);
  b = setname(b,[name '_test']);
  a = setname(a(1:60000,:),[name '_train']);
else
  a = setname(a,name);
end

