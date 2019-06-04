%SAVEMATFILE Save matfile(s) for calling mfile

function varargout = savematfile(varargin)
% nout: number of outputs of calling function 
%       nout = 1: combine all files into varargout{1}
%       nout > 1: return separate files unchanged
% For any nout, all combined and single datasets are stored

name = callername;
matfile = fullfile(fileparts(which(name)),name);

varargout = cell(1,nargout);
if nargin == 1
  a = varargin{1};
  save(matfile,'a');
  varargout{1} = a;
else
  if nargout == 1
    a = vertcat(varargin{:});
    a = setname(a,name);
    save(matfile,'a');
    varargout{1} = a;
    for i=1:nargin
      a = varargin{i};
      save([matfile '_' num2str(i)],'a');
    end
  else
    a = vertcat(varargin{:});
    a = setname(a,name);
    save(matfile,'a');
    for i=1:nargin
      a = varargin{i};
      save([matfile '_' num2str(i)],'a');
    end
    for i=1:nargout
      varargout{i} = varargin{i};
    end
  end
end

function name = callername
[ss,dummy] = dbstack;
if length(ss) < 3
	name = [];
else
	name = ss(3).name;
end