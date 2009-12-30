% imsMstNextLocation - Estimate the next location
%
% INPUT:
%  - W, weight matrix
%
% OUTPUT:
%  - y1, estimated location
%
function y1 = imsMstNextLocation(W)

	% Calculate the width and height
	[h, w] = size(W);
	h = h - 1;
	w = w - 1;

	% Create a coordinate grid where the center pixel value is (0,0)
	[X, Y] = meshgrid(-w/2:w/2, -h/2:h/2);
	
	% Weighted sum of every coordinate
	x = sum(W(:) .* X(:)) / sum(W(:));
	y = sum(W(:) .* Y(:)) / sum(W(:));
	
	% A vector that describes the movement
	y1 = [y; x];

end
