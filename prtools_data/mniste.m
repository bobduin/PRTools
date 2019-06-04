%MNISTE Compute or load MNIST dataset in eigenvector decomposition
% 
%      [TRAIN,TEST] = mniste(N)
%       TRAIN_TEST  = mniste(N)
%  
% Load the first N eigenvectors of the MNIST dataset. These are computed
% from all 60000 vectors of the TRAIN set. As the digits in the original
% dataset have size 28x28 the maximum number of eigenvectors N = 784. The
% size of TRAIN is thereby 60000xN en the size of TEST 10000*N.
% 
% REFERENCE 
% <a href="http://yann.lecun.com/exdb/mnist/" The MNIST website</a>
% 
% See also DATASETS, PRDATASETS, MNIST, MNISTR

function [a,b] = mniste(n)

name = 'mniste';
a = pr_getdata(['http://37steps.com/data/prdatasets/' name '.mat'],[],[name '.mat']);
if nargin > 0
  a = a(:,1:n);
  name = [name '_' num2str(n)];
end
if nargout == 2
  b = a(60001:end,:);
  b = setname(b,[name '_test']);
  a = setname(a(1:60000,:),[name '_train']);
else
  a = setname(a,name);
end