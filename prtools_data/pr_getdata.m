%PR_GETDATA Loads PRTOOLS dataset for any toolbox (mat-files)
%
%		OUT = PR_GETDATA(URL,SIZE,DSET,FIELD,ASK)
%		OUT = PR_GETDATA(URL,SIZE,DFILE,TYPE,ASK)
%
% Checks the availability of the PRTools dataset DSET or datafile DFILE.
% By default DSET is COMMAND.mat with COMMAND the name of the calling
% m-file. If this is not available in the directory of COMMAND the URL will
% be downloaded. If ASK = true (default), the user is asked for approval. 
% If given, SIZE (in MByte) is displayed in the request.
%
% If available, the dataset DSET stored in FIELD is returned in OUT.
% In case of a datafile DFILE, it is created, if necessary, with given TYPE
% and returned in OUT. In case the download was successful but no dataset
% or datfile could be created (e.g. because of empty TYPE) OUT is empty, 
% otherwise an error is generated.
%
% This is a low-level routine, typically used in COMMAND and not called
% from the command line. COMMAND should take care that a proper dataset
% is constucted and returned to the user.
%
% SEE ALSO (<a href="http://37steps.com/prhtml/37tools.html">37tools Contents</a>)
% DATASETS, DATAFILES

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function out = pr_getdata(varargin)

% name of calling routine, might be used for the dataset
%
%  name  : name of calling routine, might be used for the dataset
%  url   : url of dataset
%  uname : dataset name as used in url
%  dset  : becomes full path and name of dataset
%  ddir  : becomes full path of dataset
name = callername;
argin = setdefaults(varargin,[],[],[],[],true);
[url,size,dset,field,ask] = deal(argin{:});
[dummy,uname,ext] = fileparts(url);

if isempty(name)
  ddir = pwd;
else
  ddir = fileparts(which(name));
end

if isempty(dset)
  if isempty(name) 
    dset = [uname ext];
  else
    dset = [name ext];
  end
end
dset = fullfile(ddir,dset);

out = tryload(dset,field);
if isempty(out)
  if ask
    ask_download(size)
  end
  % download in dir of dset
  status = prdownload(url,fileparts(dset));
  % get naming consistent, avoid Matlab naming problems with capitals
  if ~any(strcmp(ext,{'.zip','.gz','.tgz','.tar'}))
    % compressed files are already deleted
    movefile([fullfile(fileparts(dset),uname) ext],[dset 'temp']);
    movefile([dset 'temp'],dset);
  end
  if status
    out = tryload(dset,field);
  else
    error('Download failed')
  end
elseif strcmp(out,'dir')
  if strcmp(field,'raw')
    % we have a datafile!!
    out = prdatafile(dset);
  else
    out = [];
  end
else
  a = dset;
end
  
function ask_download(size)

  global ASK
  if isempty(ASK)
    ASK = true;
  end
  
  if ASK
    if ~isempty(size)
      siz = ['(' num2str(size) ' MB)']; 
    else
      siz = '';
    end
    q = input(['Dataset is not available, OK to download ' siz ' [y]/n ?'],'s');
    if ~isempty(q) && ~strcmp(q,'y')
      error('Dataset not found')
    end
  end
  
return

function out = tryload(dset,field)
out = [];

% make sure we check for a matfile
[dummy,dummy,ext] = fileparts(dset);
if isempty(ext)
  dsetmat = [dset '.mat'];
else
  dsetmat = dset;
end

if exist([dsetmat],'file') == 2
  try
    s = prload(dsetmat);
  catch 
    out = 'error';
    return
  end
  if isstruct(s)
    if isempty(field)
      f = fieldnames(s);
      out = getfield(s,f{1});
    else
      out = getfield(s,field);
    end
  else
    out = s;
  end
elseif exist(dset,'dir') == 7
  [dummy,dfile] = fileparts(dset);
  if exist(fullfile(dset,[dfile '.mat']),'file') == 2
    out = prdatafile(dset);
  elseif ~isempty(field) 
    % field is now datafile type
    out = prdatafile(dset,field);
  else
    out = 'dir';
  end
end

function name = callername
[ss,dummy] = dbstack;
if length(ss) < 3
	name = [];
else
	name = ss(3).name;
end



