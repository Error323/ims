function imsVideoAddFrame(I, y)

	global RESULT_VIDEO TARGET_SIZE;
	
	border = 2;
	target_size = TARGET_SIZE + 2 * border;
	
	imCircle = imsCircle(target_size, border);
	imCircle = repmat(imCircle, [1 1 size(I, 3)]);
	
	xRange = round(y(2) - (target_size(2)-1) / 2:y(2) + (target_size(2)-1) / 2);
	yRange = round(y(1) - (target_size(1)-1) / 2:y(1) + (target_size(1)-1) / 2);
	
	if (min(xRange) > 0 && max(xRange) <= size(I, 2) && min(yRange) > 0 && max(yRange) <= size(I, 1)) 
		I(yRange, xRange, :) = I(yRange, xRange, :) + imCircle;
	end
	
	RESULT_VIDEO = addframe(RESULT_VIDEO, I);
	
end