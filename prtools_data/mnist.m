%MNIST The MNIST database as a datafile
%
%  [TRAINSET,TESTSET] = MNIST
%
% The MNIST database has fixed trainset and testsets. It consists of
% 10 classes of handwritten digits of 28 x 28 pixels.
% The trainset has 60000 digits and the testset 1000.
%
% LINK: http://yann.lecun.com/exdb/mnist/
%
% See also DATAFILES

function [trainset,testset] = mnist

dfile = ['mnist_train'];
trainset = pr_getdata(['http://37steps.com/data/prdatafiles/MNIST_train.zip'],42,'mnist_train','',1);
testset = pr_getdata(['http://37steps.com/data/prdatafiles/MNIST_test.zip'],[],'mnist_test','',0);
user.desc = ['This is the trainset of MNIST.'];
user.link = ['http://yann.lecun.com/exdb/mnist/'];
trainset = setuser(trainset,user);
user.desc = ['This is the testset of MNIST.'];
user.link = ['http://yann.lecun.com/exdb/mnist/'];
testset = setuser(testset,user);