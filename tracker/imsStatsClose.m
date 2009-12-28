function imsStatsClose()

	global STATS_FILE STATS RESULT_VIDEO;

	if ~isempty(STATS_FILE)
		save(STATS_FILE, 'STATS');
		plot(STATS');
	end
	
	if ~isempty(RESULT_VIDEO)
		imsVideoClose();
	end
end