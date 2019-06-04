%SETDATASET Set DATASET datafile field

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com
% Faculty EWI, Delft University of Technology
% P.O. Box 5031, 2600 GA Delft, The Netherlands

function a = setdataset(a,s)

	  
	isdataset(s);
  a.prdataset = s;
  
 return
