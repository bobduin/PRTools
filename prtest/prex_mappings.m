%PREX_mappings
%
% Test all mapping defaults

prdatasets('malaysia');
%addmy prtools

% mapp = {feateval,featrank,featsel,featselb, ...
%   featself,featsellr,featseli,featselm,featselo, ...
%   featselv,affine,cmapm, ...
%   datasetm,disnorm,fisherm,chernoffm,invsigm
  
a = malaysia;
a = setprior(a,getprior(a,0));
[a,b] = gendat(a,0.5);
b = double(b);
[m,k] = size(a);

fprintf('feateval     : %6.2f \n',a*feateval);
fprintf('feateval xval: %6.2f \n',a*feateval([],knnc,2));
fprintf('featrank     : %6.0f \n',a*featrank);
fprintf('featrank out2: %6.2f \n',a*(featrank*out2));
fprintf('featsel      : %6.0f \n',size(a*featsel(k,[2 3]),2));
fprintf('featsel      : %6.0f \n',size(b*featsel(k,[2 3]),2));
fprintf('featselb     : %6.0f \n',size(b*featselb(a,[],5),2));
fprintf('featselb out2: %6.0f \n',size(a*(featselb([],[],5)*out2),2));
fprintf('featself     : %6.0f \n',size(b*featself(a,[],5),2));
fprintf('featself out2: %6.0f \n',size(a*(featself([],[],5)*out2),2));
fprintf('featsellr     : %6.0f \n',size(b*featsellr(a,[],5,2,1),2));
fprintf('featsellr out2: %6.0f \n',size(a*(featsellr([],[],5,2,1)*out2),2));
fprintf('featselo     : %6.0f \n',size(b*featselo(a,[],5),2));
fprintf('featselo out2: %6.0f \n',size(a*(featselo([],[],5)*out2),2));
fprintf('featseli     : %6.0f \n',size(b*featseli(a,[],5),2));
fprintf('featseli out2: %6.0f \n',size(a*(featseli([],[],5)*out2),2));
fprintf('featselp     : %6.0f \n',size(b*featselp(a,[],5),2));
fprintf('featselp out2: %6.0f \n',size(a*(featselp([],[],5)*out2),2));
fprintf('featselv     : %6.0f \n',size([b,b(:,1:2)]*([a,ones(m,2)]*featselv),2));
