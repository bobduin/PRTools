%MNISTDT 70000 MNIST digits represented by a 28x28 Distance Transform
%
%    [TRAIN,TEST] = MNISTDT(TYPE)
%     TRAIN_TEST  = MNISTDT(TYPE)
%
% Load the MNIST dataset. These are the original MNIST digits, normalised
% such that they fit exactly in images of 28x28 pixels. Next they are
% thresholded on level 0.5 and two distance transforms are computed on the
% digits as well as on the backgrounds. These are combined: background 
% positive, and digits negative. The first 60000 objects are the original
% training set, the last 10000 are the original test set.
% 
% The following cases for TYPE are supported
% - 'org' (default) the combined distance transforms: background positive,
%   digit negative
% - 'log' background and forground are first logarithmicly scaled before 
%   combining.
% - 'digit' just the distance transform of the inner side of the digits.
%   The background is set to zero.
% - 'background' just the distance transform of the background. The digits
%   are set to zero.
%
% REFERENCE 
% <a href="http://yann.lecun.com/exdb/mnist/" The MNIST website</a>
%
% See also DATASETS, PRDATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function [a,b] = mnistdt(type)

  if nargin == 0
    type = 'org';
  end
  if ~strcmpi(type,'background')
    name = 'mnist_distt_neg';
    aneg = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
  end
  if ~strcmpi(type,'digit')
    name = 'mnist_distt_pos';
    apos = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
  end
  switch lower(type)
    case 'org'
      a = apos-aneg;
    case 'background'
      a = apos;
    case 'digit'
      a = aneg;
    case 'log'
      a = log(apos+1) - log(aneg+1);
    otherwise
      error('Unknown type')
  end
  name = 'mnistdt';
  if nargout == 2
    b = a(60001:end,:);
    b = setname(b,[name '_test']);
    a = setname(a(1:60000,:),[name '_train']);
  else
    a = setname(a,name);
  end

return

