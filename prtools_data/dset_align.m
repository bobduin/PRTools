%DSET_ALIGN Align dataset w.r.t. categorical data
%
%   [A,B, ...} = DSET_ALIGN(A,B, ...)
%
% Align datasets (partially) based on categorical data. Without a call to
% this routine they might be coded differently.
%
% SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>
% DATASETS, SETFEATDOM, FEATTYPES, DSET2CELL, CELL2DSET

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function varargout = dset_align(varargin)

varargout = cell(1,nargin);

a = varargin{1};
isdataset(a);
m = zeros(1,nargin);
m(1) = size(a,1);

for j=2:nargin
  b = varargin{j};
  a = [a;b];
  m(j) = size(b,1);
end

n = 1;
for j=1:nargin
  b = a(n:sum(m(1:j)),:);
  varargout{j} = setname(b,getname(varargin{j}));
  n = n+m(j);
end


