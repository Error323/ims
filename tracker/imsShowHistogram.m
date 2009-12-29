% imsShowHistogram
%	Graphical display of a normalized rgb histogram.
%
% input:
%	H	A normalized rgb histogram.
%
function imsShowHistogram(H)

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