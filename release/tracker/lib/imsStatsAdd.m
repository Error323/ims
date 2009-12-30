% imsStatsAdd - Add statistics and results and/or show visual output
%
% INPUTS:
%  - i, frame number
%  - I, frame
%  - q, target model
%  - p, current model
%  - bC, Bhattacharyya coefficient
%  - bD, Bhattacharyya distance
%
function imsStatsAdd(i, I, q, p, y, bC, bD)

	global STATS STATS_FILE RESULT_VIDEO VISUAL_OUTPUT;
	
	if ~isempty(STATS_FILE)
		STATS(i, :) = y';
	end
	
	if ~isempty(RESULT_VIDEO)
		imsVideoAddFrame(I, y);
	end

	if VISUAL_OUTPUT
		imsMstVisualize(I, q, p, y, bC);
	end

end