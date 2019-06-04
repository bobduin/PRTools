%FLOWCYTO_2012 Load flow-cytometry dataset.
%
%   A = FLOWCYTO_2012(TUBE,CLASS,YEAR,FLAG)
%
% INPUT
%   TUBE   Vector of integers [1,5] pointing to the desired tube. 
%          Default 3.
%   CLASS  Vector of integer pointers in the list of class names, 
%          aneuploid, diploid, multi-aneuploid, tetraploid, multi
%          aneuploid, peridiploid. Default [1,2,4]
%   YEAR   Vector of integers [2005:2012] pointing to the desired years.
%          Default: all.
%   FLAG   0 - remove all repeated measurments, including first ones
%          1 - take just first of repeated measurements
%          2 - take just last ones of repeated measurements
%
% OUTPUT
%   A      Dataset.
%
% DESCRIPTION
% These datasets are based on FL3-A DNA flowcytometer histograms from
% breast cancer tissues in 1024 resolution. The initial data have been 
% acquired by M. Nap and N. van Rodijnen of the Atrium Medical Center in 
% Heerlen, The Netherlands, during 2005-2012, using tubes 1-5 of a DACO 
% Galaxy flowcytometer (TUBE = 1-5). 
%
% Histograms are labeled in 3 classes: aneuploid (547), diploid (457) and
% tetraploid(152). The numbers report the numbers of histograms of Tube 3.
% The first two and the last two bins (1,2,1023,1024) of every histogram 
% are removed as they may contain noise. After that histograms are 
% normalized (sum to one) resulting in a dataset with 1020 features.
%
% In case multiple tubes are request (number of elements in TUBE > 1) the
% corresponding datasets are concatenated, but patients are removed for
% which not for all tubes a histogram is available.
%
% The final dataset is multi-labeled, see MULTI_LABELING, with the
% following names for the label lists:
% 1  default     unlabeled
% 2  Number      patient number
% 3  Tube        Tube number (1:5)
% 4  Class       6 possible histogram labels
% 5  Year        year of measurement (2005:2012)
% The actual label list may be changed by CHANGELABLIST. Standard 'Class'
% is returned in A.
% 
% SEE ALSO
% PRTOOLS, DATASETS, MULTI_LABELING, CHANGELABLIST

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com


function a = flowcyto_2012(varargin)

[tubes,classes,years,flag] = setdefaults(varargin,3,[1 2 4],[2005:2012],1);
name = 'flowcyto_2012';
thisdir = fileparts(which(mfilename));
if exist(fullfile(thisdir,'flowcyto_2012.mat'),'file') == 2
  s = load(fullfile(thisdir,'flowcyto_2012.mat'));
  a = s.a;
else
  a = pr_getdata('http://37steps.com/data/prdatasets/FlowCyto_2012.mat',6,[],'a',1);
  savematfile(a);
end
  
a = selclass(a,{},'Tube');
b = cell(1,numel(tubes));
for j = 1:numel(tubes)
  b{j} = singletube(a{tubes(j)},classes,years,flag);
end
a = vertcat(b{:});
if numel(tubes) > 1
  a = changelablist(a,'Number');
  a = remclass(a,numel(tubes)-1); % make small classes (<=3) unlabeled
  a = seldat(a);                  % remove them
  a = changelablist(a,'Class');
end
a = a*normm;
a = setname(a,name);
return


function a = singletube(a,classes,years,flag)

a = selclass(a,classes,'Class');
a = selclass(a,years-2004,'Year');
a = remclass(changelablist(a,'Number'));

if flag == 0
  % remove all multiples in patient numbers
  n = getnlab(a);
  s = classsizes(a);
  T = true(1,size(a,1));
  L = find(s>1);
  for j=1:numel(L)
    k = find(n==L(j));
    T(k) = false;
  end
  a = changelablist(a(T,:),'Class');
elseif flag == 1
  % find all multiples in patient numbers and take first
  n = getnlab(a);
  s = classsizes(a);
  T = true(1,size(a,1));
  L = find(s>1);
  for j=1:numel(L)
    k = find(n==L(j));
    T(k(2:end)) = false;
  end
  a = changelablist(a(T,:),'Class');
elseif flag == 2
  % find all multiples in patient numbers and take last
  n = getnlab(a);
  s = classsizes(a);
  T = true(1,size(a,1));
  L = find(s>1);
  for j=1:numel(L)
    k = find(n==L(j));
    T(k(1:end-1)) = false;
  end
  a = changelablist(a(T,:),'Class');
else
  error('FLAG has wrong value')
end
return


