function imsMstVisualize(I, q, p, y, bD)

	global TARGET_SIZE;

	imCircle = imsCircle(TARGET_SIZE, 2);
	imCircle = repmat(imCircle, [1 1 size(I, 3)]);
	
	xRange = round(y(2) - (TARGET_SIZE(2)-1) / 2:y(2) + (TARGET_SIZE(2)-1) / 2);
	yRange = round(y(1) - (TARGET_SIZE(1)-1) / 2:y(1) + (TARGET_SIZE(1)-1) / 2);
	I(yRange, xRange, :) = I(yRange, xRange, :) + imCircle;
	
	clf;
	
	subplot(2,3,[1 2 4 5]);
	imshow(I);

	subplot(2,3,3);
	imsShowHistogram(q);

	subplot(2,3,6);
	imsShowHistogram(p);

	drawnow;
end
