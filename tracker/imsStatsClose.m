function imsStatsClose()

	global STATS_FILE STATS RESULT_VIDEO;

	if ~isempty(STATS_FILE)
		save(STATS_FILE, 'STATS');
		plot(STATS(:, 2), STATS(:, 1));
	end
	
	if ~isempty(RESULT_VIDEO)
		imsVideoClose();
	end
end