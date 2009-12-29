function sFileName = imsStatsFile(sVideo, sRegion)
    idx = regexp(sVideo, '/');
    iLast = max(idx);
    sFileName = sVideo(iLast+1:length(sVideo));
    sFileName = strrep(sFileName, '.avi', '');
    sFileName = [sFileName '_' sRegion '.mat'];
end