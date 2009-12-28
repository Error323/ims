function imsStatsInit()

	global STATS_FILE STATS VIDEO_FRAMES RESULT_VIDEO;

	if ~isempty(STATS_FILE)
		if exist(STATS_FILE, 'file')
			load(STATS_FILE);
			STATS(size(STATS, 1) + 1, :) = 0;
		else
			STATS = zeros(1, VIDEO_FRAMES);
		end
	end
	
	if ~isempty(RESULT_VIDEO)
		imsVideoInit();
	end
	
end
