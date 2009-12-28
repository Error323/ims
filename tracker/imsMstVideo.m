function imsMstVideo(I, q, p, y, bD)

	global TARGET_SIZE OUTPUT_VIDEO;

	x1 = floor(y(2) - TARGET_SIZE(2) / 2); 
	x2 =  ceil(y(2) + TARGET_SIZE(2) / 2); 
	y1 = floor(y(1) - TARGET_SIZE(1) / 2); 
	y2 =  ceil(y(1) + TARGET_SIZE(1) / 2); 
	I(y1:y2, x1:x2, 3) = 1;
	
	OUTPUT_VIDEO = addframe(OUTPUT_VIDEO, im2frame(I));

end
