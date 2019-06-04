%PR_DOWNLOAD_UCI  Load UCI data and convert to PRTools format
%
%   [A,B, ...] = PR_DOWNLOAD_UCI(UCIDIR,DNAMS,OPTIONS)
%
% INPUT
%   UCIDIR   Name of desired UCI repository directory
%   DNAMS    Character cell array of UCI data files names to be downloaded
%            or some full urls.
%   OPTIONS  Structure with options for parsing, see PR_DOWNLOAD
%            OPTIONS may also be a cell array with options, one for every
%            data file. Common fields may be defined in an additional
%            element of the cell array.
%
% DESCRIPTION
% This routine loads data sets from the <a href="http://archive.ics.uci.edu/ml/datasets/">UCI Machine Learning Repository</a>.
% and converts them into PRTools datasets. The downloaded files are stored
% as .dat-files, the PRTools datasets as .mat-files in the directory of
% this routine. The file names of the calling routine are used. Various
% annotations are stored in the user-field of the PRTools datasets.
%
% This routine also accepts an old, undocumented format.
%
% EXAMPLE
% opt.nheadlines = 5;
% [a,b] = pr_download_uci('Image+Segmentation', ...
%         {'segmentation.data','segmentation.test'},opt);
%
% SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function varargout = pr_download_uci(name,varargin)
%%

%% handle old format
if nargin > 3 || (nargin == 3 && ischar(varargin{2}))
%if ~(nargin == 3 && (iscell(varargin{2}) || isstruct(varargin{2})))
  varargout = cell(1,nargout);
  [varargout{:}] = pr_download_uci_old(name,varargin{:});
  return
end

%% get inputs: data files (ucinames) and parse options
[ucinames,opt] = setdefaults(varargin,{[lower(name) '.data']},[]);
if ~iscell(ucinames)
  ucinames = {ucinames};
end

if iscell(opt)
  if numel(opt) == numel(ucinames)+1
    % multiple structures to combine, opt{end} is common
    for n=1:numel(opt)-1
    % copy the common fields into the other stuctures
      M = [fieldnames(opt{end})' fieldnames(opt{n})'; ...
           struct2cell(opt{end})' struct2cell(opt{n})'];
      opt{n} = struct(M{:});
    end
  elseif numel(opt) ~= numel(ucinames)
    error('Number op option-structures is wrong')
  end
else
  opt = repmat({opt},1,numel(ucinames)+1);
end
% Now opt{n} should correspond to ucinames{n}


%% where to store: names of data file, mat file and directory
prname    = callername; % filenames
thisdir   = callerdir;  % directory
if isempty(prname)
  % call from command line
  prname = name;
  thisdir = pwd;
end
varargout  = cell(1,numel(ucinames)); 
% might be too large, will be corrected

%% if matfiles available, use them
[varargout{:}] = loadmatfile(prname);
if ~isempty(varargout{1}), return; end


%% get UCI info
data = parselink(name);
url = data.url;

%% Handle for all data files
anynew = false;
for j=1:numel(ucinames)
  uciname = ucinames{j};
  if strcmp(uciname(1:4),'http')
    % full url given, use it
    data.url = uciname;
  else
    % construct url from UCI info
    data.url = [url uciname];
  end
  if numel(ucinames) > 1
    dataname = [prname '_' num2str(j)];
  else
    dataname = prname;
  end
  opt{j}.dsetname = dataname;
  savemat = ~isfield(opt{j},'matfile') || opt{j}.matfile;
  opt{j}.matfile  = false;
  a = pr_download(data.url,fullfile(thisdir,dataname),opt{j});
  a = setuser(a,data,'user'); % store dataset info
  a = setname(a,dataname);    % set dataset name
  if ~isfield(opt{j},'labfeat') || isempty(opt{j}.labfeat)
    a = feat2lab(a,size(a,2));
  end
  if savemat
    save(fullfile(thisdir,dataname),'a');
  end
  varargout{j} = a;
end

%% combine them
if numel(ucinames) > 1
  % multiple datasets loaded, alignment might be needed
  [varargout{:}] = dset_align(varargout{:});
  a = vertcat(varargout{:});
  a = setuser(a,data,'user'); % store dataset info
  a = setname(a,prname);    % set dataset name
  if ~isfield(opt{end},'matfile') || opt{end}.matfile
    save(fullfile(thisdir,prname),'a');
  end
  if nargout == 1 % just combined set is requested
    varargout{1} = a;
  end
end

function varargout = pr_download_uci_old(name,varargin)
%% take care of old definition
[ucinames,form,prname,siz,nhead,misvalchar,delchar,cfeat,nosave] = ...
          setdefaults(varargin,{[lower(name) '.data']},[],[],[],[],'?',',',[],false);
nhead = setdefaults({nhead},zeros(1,numel(ucinames))); % headerlines to be skipped

if ~iscell(ucinames)
  ucinames = {ucinames};
end
if isempty(cfeat)
  cfeat = repmat({[]},1,numel(ucinames));
end
if ~iscell(cfeat)
  cfeat = repmat({cfeat},1,numel(ucinames));
end

prname  = setdefaults({prname},callername(1));
prname  = setdefaults({prname},lower(name));
thisdir = fileparts(which(mfilename));

if isempty(siz)
  % no sizes given, make all 0
  siz = zeros(1,numel(ucinames)); 
end

varargout = cell(1,numel(ucinames));
anynew    = false;
filenames = cell(1,numel(ucinames));
for j=1:numel(ucinames)
  uciname = ucinames{j};
  if numel(ucinames) > 1
    dataname = [prname '_' num2str(j)];
  else
    dataname = prname;
  end
  filenames{j} = fullfile(thisdir,dataname);
  if exist([filenames{j} '.mat'],'file') == 2
    % if mat-file is available, use it
    s = load([filenames{j} '.mat']);
    f = fieldnames(s);
    a = getfield(s,f{1});
  else
    if ~exist('data')
      % get UCI info
      data = parselink(name);
      if ~data.misval % avoid checking missing values if not needed
        misvalchar = [];
      end
      url = data.url;
    end    
    if strcmp(uciname(1:4),'http')
      % full url given, use it
      data.url = uciname;
    else
      % construct url from UCI info
      data.url = [url uciname];
    end
    % do the real work
    a = pr_download(data.url,filenames{j},siz(j),nhead(j),form,misvalchar,delchar,true);
    if ischar(cfeat{j})
      labfile = [filenames{j} '_lab'];
      % old call to pr_download
      labs = +pr_download([url cfeat{j}],labfile,0,[],[],[],[],true);
      if isempty(labs) || size(labs,1) ~= size(a,1)
        warning(['No correct label file found: ' [url cfeat{j}]]);
      else
        delete([labfile '.dat']);
        a = setlabels(a,+labs);
      end
    else
      if isempty(cfeat{j}) % find labels and use them
        a = feat2lab(a,size(a,2));
      elseif cfeat{j} ~= 0
        a = feat2lab(a,cfeat{j});
      end
    end
    a = setuser(a,data,'user'); % store dataset info
    a = setname(a,dataname);    % set dataset name
    save([filenames{j} '.mat'],'a'); % save it
    anynew = true;
  end
  varargout{j} = a;
end

if anynew && numel(ucinames) > 1
  % multiple datasets loaded, alignment might be needed
  [varargout{:}] = dset_align(varargout{:});
  for j=1:numel(ucinames)
    a = varargout{j};
    if ~nosave
      save(filenames{j},'a');
    end
  end
end

function data = parselink(link)
%% Parse info from a particular UCI ML data set
% data.link : url of the particular data set pages
% data.info : url of the data set info page
% data.url  : url of the data set data files (excluding the filename, as
%              there might be more files and their names ar irregular)
% data.desc : the problem infor as given in the abstract;
% data.misval : true/false for missing values
% data.type : feature types (categorical / integer / real)

link = ['http://archive.ics.uci.edu/ml/datasets/' link];
desc = urlread(link);
k = strfind(desc,'Download');
s = desc(k:k+250);
k = strfind(s,'"');
url = ['http://archive.ics.uci.edu/ml/' s(k(1)+4:k(2)-1)];
info = ['http://archive.ics.uci.edu/ml/' s(k(5)+3:k(6)-1)];

k1 = strfind(desc,'Abstract</b>');
if ~isempty(k1)
  k2 = strfind(desc(k1+12:end),'</p>');
  descr = desc(k1+14:k1+k2+10);
end

k = strfind(desc,'Attribute Characteristics:</b></p></td>');
type = desc(k+64:k+150);
k = strfind(type,'</p');
type = textscan(type(1:k-1),'%s','delimiter',',');
type = char(type{1});

k1 = strfind(desc,'Missing Values');
if strcmp(desc(k1+53:k1+54),'No')
  misval = false;
elseif strcmp(desc(k1+53:k1+55),'Yes')
  misval = true;
else
  misval = [];
end

data.link = link;
data.info = info;
data.url  = url;
data.desc = descr;
data.misval = misval;
data.type = type;


function name = callername(n)
%%
if nargin < 1, n=0; end
[ss,dummy] = dbstack;
if length(ss) < n+3
	name = [];
else
	name = ss(n+3).name;
end

function dirname = callerdir(n)
%%
if nargin < 1, n=0; end
ss = dbstack;
if length(ss) < 3
  % no caller, commandline call
  dirname = pwd;
else
  dirname = fileparts(which(ss(n+3).name));
end
