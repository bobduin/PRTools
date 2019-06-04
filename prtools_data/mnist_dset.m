%MNIST_DSET The MNIST database as a PRTools dataset
%
%  [TRAIN,TEST] = MNIST_DSET
%   TRAIN_TEST  = MNIST_DSET
%
% The MNIST database as supplied by Yann LeCun in PRTools format. It
% contains of 10 classes of handwritten digits of 28 x 28 pixels.
% The trainset has 60000 digits and the testset 1000.
%
% SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://yann.lecun.com/exdb/mnist/">Original Website</a>
% PRTOOLS, DATASETS, SHOW


function [a,b] = mnist_dset

thisdir = fileparts(which(mfilename));
if exist(fullfile(thisdir,'mnist_dset.mat'),'file') == 2
  s = load(fullfile(thisdir,'mnist_dset.mat'));
  a = s.a;
  b = s.b;
else
  a = pr_getdata(['http://37steps.com/data/prdatafiles/MNIST_train.zip'],42,'mnist_train','',1);
  b = pr_getdata(['http://37steps.com/data/prdatafiles/MNIST_test.zip'],[],'mnist_test','',0);
  user.desc = ['This is the trainset of MNIST.'];
  user.link = ['http://yann.lecun.com/exdb/mnist/'];
  a = setuser(a,user)*datasetm;
  user.desc = ['This is the testset of MNIST.'];
  user.link = ['http://yann.lecun.com/exdb/mnist/'];
  b = setuser(b,user)*datasetm;
  save(fullfile(thisdir,'mnist_dset.mat'),'a','b');
  delete([fullfile(thisdir,'mnist_train'),'/*']);
  delete([fullfile(thisdir,'mnist_test'),'/*']);
  rmdir(fullfile(thisdir,'mnist_train'));
  rmdir(fullfile(thisdir,'mnist_test'));
end

if nargout < 2, a = [a;b]; a = setname(a,'mnist'); end
