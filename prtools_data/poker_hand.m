%POKER_HAND Prediction of poker hands
%PRTools UCI dataset import, 25010+1000000 objects, 10 mixed features, 10 classes
%
%  [TRAIN,TEST] = POKER_HAND
%   TRAIN_TEST  = POKER_HAND
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Poker+Hand">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%Dataset has missing values. See MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, FEATTYPES, CAT2REAL, MISVAL

% Copyright: R.P.W. Duin, r.p.w.duin@prtools.org

function [a,b] = poker_hand

[a,b] = pr_download_uci('Poker+Hand',{'poker-hand-training-true.data','poker-hand-testing.data'},[],[],[1 23]);
lablist = {'nothing','one pair','two pairs','three of a kind', ...
           'straight','flush','full house','four of a kind', ...
           'straight flush','royal flush'};
a = setlablist(a,lablist);
b = setlablist(b,lablist);
featlab = {'suit1','rank1','suit2','rank2','suit3','rank3', ...
           'suit4','rank4','suit5','rank5'};
a = setfeatlab(a,featlab);
b = setfeatlab(b,featlab);
suits = char('hearts','spades','diamonds','clubs');
a = setfeatdom(a,{suits,suits,suits,suits,suits},[1 3 5 7 9]);
b = setfeatdom(b,{suits,suits,suits,suits,suits},[1 3 5 7 9]);
if nargout < 2, a = [a;b]; a = setname(a,'poker_hand'); end



