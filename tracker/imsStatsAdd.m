function imsStatsAdd(i, I, q, p, y, bC, bD)

	global STATS STATS_FILE RESULT_VIDEO VISUAL_OUTPUT;
	
	if ~isempty(STATS_FILE)
		STATS(end, i) = bD;
	end
	
	if ~isempty(RESULT_VIDEO)
		imsVideoAddFrame(I, y);
	end

	if VISUAL_OUTPUT
		imsMstVisualize(I, q, p, y, bC);
	end

end