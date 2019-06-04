%PR_DATASET Switch between dataset and prdataset

function varargout = pr_dataset(varargin)

varargout = cell(1,nargout);
if floor(prversion) == 4
  [varargout{:}] = dataset(varargin{:});
else
  [varargout{:}] = prdataset(varargin{:});
end