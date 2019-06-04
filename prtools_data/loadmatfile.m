%LOADMATFILE  Load matfile for this mfile, if it exist
%
%    A = LOADMATFILE(MATFILE)
%
% Loads the dataset stored in the matfile. Default matfile is the name of
% the calling routine. 
%
%    [A1,A2,..] = LOADMATFILE(MATFILE,NARGOUTCOUNT)
%
% In case multiple matfiles are stored for the calling routine, it is
% assumed they all contain a dataset: train set, test set, validation set,
% etcetera. In case NARGOUTCOUNT (NARGOUT of the calling routine) equals 1,
% the combined dataset is loaded and returned in A (A1). 
% In case NARGOUTCOUNT > 1, the subsets are are loaded into A1, A2, ... 
%
% SEE ALSO
% DATASETS, PRDATASETS, SAVEMATFILE, PR_DOWNLOAD_UCI

function varargout = loadmatfile(name)

varargout = cell(1,nargout);

if nargin < 1 || isempty(name)
  name = callername;
end
matfile = fullfile(fileparts(which(name)),name);

if nargout == 1
  varargout{1} = loadmatf([matfile '.mat']);
else
  for i=1:nargout
    varargout{i} = loadmatf([matfile '_' num2str(i) '.mat']);
  end
end

return
  
function a = loadmatf(matfile)
  if exist(matfile,'file') == 2
    s = load(matfile);
    fields = fieldnames(s);
    a = getfield(s,fields{1});
  else
    a = [];
  end
return

function name = callername
  [ss,dummy] = dbstack;
  if length(ss) < 3
    name = [];
  else
    name = ss(3).name;
  end
return