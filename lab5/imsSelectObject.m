function [x, y, w, h] = imsSelectObject()
	H = imrect;

	pos = getPosition(H);
	
	x = round(pos(1));
	y = round(pos(2));
	w = round(pos(3));
	h = round(pos(4));
end	    