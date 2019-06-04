%DOWNLOAD_ASK Global setting, asking for permission to download
%
%   DOWNLOAD_ASK TRUE  Ask permission for every download (default setting)
%   DOWNLOAD_ASK FALSE Downloading will be done automatically 

function download_ask(asking)

global ASK
if isempty(ASK)
  ASK = true;
end

if asking
  ASK = true;
else
  ASK = false;
end