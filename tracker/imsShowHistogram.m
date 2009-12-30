% imsShowHistogram - Graphical display of a normalized rgb histogram.
%   NOTE That 3D histograms are displayed as 2D histograms containing only
%   the first two dimension. (i.e. all values in the 3rd dimension are
%   summed.
%
% INPUT:
%	- H, an histogram (i.e. a model)
%
function imsShowHistogram(H)

	% Calculate number of bins per dimension
	[bins, d] = imsGetBins();
	n = round(bins^(1/d));
	
	H = reshape(H, n, n, []);
	H = sum(H, 3);

	% Calculate the dimensions of the surface overlay.
	h = (n - 1) * 4;
	w = (n - 1) * 4;
	
	% Create the surface overlay (i.e. an image containing normalized rgb
	% values).
	img = imsSurface(w, h);
	
	% Plot the histogram surface.
	surface(H, ...
		flipdim(img, 1), ...
		'EdgeColor','black', ...
		'FaceColor', 'texturemap', ...
		'CDataMapping', 'direct');
	
	% Change the viewing angle.
	view(-25,45);
end