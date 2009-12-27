% imsSelectRoi
%	Select the ROI (i.e. target object) by user input.
%
% output:
%	x	left most x coordinate
%	y	bottom most y coordinate
%	w	width of the bounding box
%	h	height of the bounding box
%
function [x, y, w, h] = imsSelectRoi()

	% Let the user draw a rectangle in the current figure
	H = imrect;

	% Retrieve the position and dimensions of the rectangle
	pos = getPosition(H);
	
	% Split the values into separate variables
	x = round(pos(1));
	y = round(pos(2));
	w = round(pos(3));
	h = round(pos(4));
		
end	    