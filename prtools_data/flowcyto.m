%FLOWCYTO Load 4 flow-cytometry datasets.
%
%   A = FLOWCYTO(N)
%
% These datasets are based on 612 FL3-A DNA flowcytometer histograms
% from breast cancer tissues in 256 resolution. The initial data have been 
% acquired by M. Nap and N. van Rodijnen of the Atrium Medical Center in 
% Heerlen, The Netherlands, during 2000-2004, using tubes 3-6 of a DACO 
% Galaxy flowcytometer (N = 1-4). Histograms are labeled in 3 classes: 
% aneuploid (335 patients), diploid (131) and tetraploid (146). The first
% and the last bin (1 and 256) are set to 0, as they contsin noise. After
% that histograms are normalized (sum to one) resulting in a dataset with
% 254 features.
% 
% The four datasets are aligned for the same patients, but are based on
% different measurements.
%
% SEE ALSO
% PRTOOLS, DATASETS

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com


function a = flowcyto(n)

if nargin < 1 || isempty(n)
  n = 1;
end

if any(n<1) || any(n>4)
  error('Dataset number should be larger than 0 and smaller than 5')
end

d = pr_getdata('http://37steps.com/data/prdatasets/FlowCyto_sort.mat',5);

a = cell(1,numel(n));
for j=1:numel(n)
  x = prdataset(d{n(j)});
  x = setname(x(:,2:255),['FlowCytoDis-' num2str(n(j))]);
  desc = ['These datasets are based on 612 FL3-A DNA flowcytometer histograms' ...
  'from breast cancer tissues in 256 resolution. The initial data have been' ...
  'acquired by M. Nap and N. van Rodijnen of the Atrium Medical Center in' ...
  'Heerlen, The Netherlands, during 2000-2004, using tubes 3-6 of a DACO' ...
  'Galaxy flowcytometer (N = 1-4). Histograms are labeled in 3 classes:' ...
  'aneuploid (335 patients), diploid (131) and tetraploid (146). The first' ...
  'and the last bin (1 and 256) are set to 0, as they contsin noise. After' ...
  'that histograms are normalized (sum to one) resulting in a dataset with' ...
  '254 features.'];
  ref = {['']};
  link = {'The PRDisData toolbox for loading dissimilarity data','http://37steps.com/prdisdata/'; ...
        'The DisTools toolbox for handling dissimilarity data:','http://37steps.com/prdistools/'};
  x = setprior(x,getprior(x,0));
  x = setuser(x,desc,'desc');
  x = setuser(x,ref,'ref');
  x = setuser(x,link,'link');
  a{j} = x;
end

if numel(a) == 1
  a = a{1};
end


