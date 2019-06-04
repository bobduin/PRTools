%PREX_ALL_OCTAVE
%
% Run all PREX files

more off
global ASK

ASK = false;
pkg load optim
pkg load image

%make sure dipimage is not in the path
rmpath(fileparts(which('berosion')));

%addpc libsvm
addpc prdatasets
addpc prdatafiles

if ~isoctave
  pause off
end

prex_cleval     
prex_combining  
prex_confmat    
prex_datafile   
prex_datasets   
prex_density
prex_parzen
prex_eigenfaces 
prex_matchlab   
prex_mcplot     
prex_plotc     
prex_mds
prex_som        
prex_spatm      
prex_cost       
prex_logdens    
prex_soft       
prex_regr       

prex_classifiers_octave
prex_mappings     
%dipstart % now start diplib
prex_dyadic