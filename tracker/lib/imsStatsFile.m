% imsStatsFile - Returns the name of a statistics file
%
% INPUTS:
%  - sVideo, the path of the video file or folder
%  - sObject, the name of the object
%
% OUTPUT:
%  - sFileName, the name of a statistics file
%
function sFileName = imsStatsFile(sVideo, sObject)
    idx = regexp(sVideo, '/');
    iLast = max(idx);
    sFileName = sVideo(iLast+1:length(sVideo));
    sFileName = strrep(sFileName, '.avi', '');
    sFileName = [sFileName '_' sObject '.mat'];
end