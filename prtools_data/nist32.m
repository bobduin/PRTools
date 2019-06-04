%NIST32 5000 handwritten digits given by 32x32 binary (0/1) pixels (features) in 10 classes
%
%	A = NIST32(digits)
%
% Load the desired digits (0,1,2,3,4,5,6,7,8 or 9) in the dataset A.
%
% See also DATASETS, PRDATASETS, NIST16

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands


function a = nist32(N)
if nargin < 1, N = [0:9]; end
a = pr_getdata('http://37steps.com/data/prdatasets/nist32.mat',1);

% prdatasets(mfilename,1);
% a = pr_dataset('nist32');
a = setname(a,'NIST32 Binary Digits');
a = selclass(a,N+1);
