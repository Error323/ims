function imsStatsInit()

	global STATS_FILE STATS RESULT_VIDEO;

	if ~isempty(STATS_FILE)
		if exist(STATS_FILE, 'file')
			delete(STATS_FILE);
		end
	end
	STATS = [];
	
	if ~isempty(RESULT_VIDEO)
		imsVideoInit();
	end
	
end
