%MNISTG 70000 normalised digits given by NxN pixels in 10 classes
%
%    [TRAIN,TEST] = MNISTG(N)
%     TRAIN_TEST  = MNISTG(N)
%
% Load the MNIST dataset. These are blurred MNIST digits by IM_GAUSS([],N).
% The images size is still 28*28. Supported values for N are 1 2 3 4 5 6 7
% 8 1.2 1.4 1.6 1.8 0.2 0.4 0.6 0.8. Default returns the original dataset.
%
% REFERENCE 
% <a href="http://yann.lecun.com/exdb/mnist/" The MNIST website</a>
%
% See also DATASETS, PRDATASETS, MNISTR

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function [a,b] = mnistg(n)

if nargin == 0
  name = 'mnist';
  a = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
elseif n == 0
  name = 'mnist';
  a = mnistr;
else
  name = ['mnist_blurr_' num2str(n)];
%   if all(n ~= [1 2 3 4 5 6 7 8 1.2 1.4 1.6 1.8 0.2 0.4 0.6 0.8]);
%     error(['Dataset ' name ' not available'])
%   end
  a = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
end
if nargout == 2
  b = a(60001:end,:);
  b = setname(b,[name '_test']);
  a = setname(a(1:60000,:),[name '_train']);
else
  a = setname(a,name);
end

