function imsMstVisualize(I, q, p, y, bD)

	global TARGET_SIZE;

	border = 2;
	target_size = TARGET_SIZE + 2 * border;
	
	imCircle = imsCircle(target_size, border);
	imCircle = repmat(imCircle, [1 1 size(I, 3)]);
	
	xRange = round(y(2) - (target_size(2)-1) / 2:y(2) + (target_size(2)-1) / 2);
	yRange = round(y(1) - (target_size(1)-1) / 2:y(1) + (target_size(1)-1) / 2);
	
	if (min(xRange) > 0 && max(xRange) <= size(I, 2) && min(yRange) > 0 && max(yRange) <= size(I, 1)) 
		I(yRange, xRange, :) = I(yRange, xRange, :) + imCircle;
	end
	
	clf;
	
	subplot(2,3,[1 2 4 5]);
	imshow(I);

	subplot(2,3,3);
	imsShowHistogram(q);

	subplot(2,3,6);
	imsShowHistogram(p);

	drawnow;
end
