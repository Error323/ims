
function y1 = imsMstNextLocation(W)

	[h, w] = size(W);
	h = h - 1;
	w = w - 1;
	
	[X, Y] = meshgrid(-w/2:w/2, -h/2:h/2);
	
	x = sum(W(:) .* X(:)) / sum(W(:));
	y = sum(W(:) .* Y(:)) / sum(W(:));
	
	y1 = [y; x];

end
