datasetdir = fileparts(which('isolet'));
files = cellstr(ls([datasetdir '/*.m']));
nocheck = {'pr_dataset','pr_download','pr_download_','pr_download_uci', ...
  'mfeat_all', 'pr_readdataset','download_ask', 'dset_align', ...
  'loadmatfile','check_prdatasets','cat2real','cat2feat','Contents', ...
  'pr_readdataset_org', 'savematfile'};

download_ask(false);
for n=36:numel(files)
  [dummy,file] = fileparts(files{n});
  if isempty(strmatch(file,nocheck,'exact'))
    disp(file)
    a = feval(file)
    a = setprior(a,getprior(a,0));
    %disp(prcrossval(setprior(a,getprior(a,0)),nmc,2))
    if getsize(a,3) > 1
      disp(prcrossval(a,remclass*nmc,2,[],testd))
    end
  end
end


  
  
  
  