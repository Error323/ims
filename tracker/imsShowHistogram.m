% imsShowHistogram
%	Graphical display of a normalized rgb histogram.
%
% input:
%	H	A normalized rgb histogram.
%
function imsShowHistogram(H)

	global BINS;
	
	H = reshape(H, BINS, []);

	% Calculate the dimensions of the surface overlay.
	h = (size(H, 1) - 1) * 4;
	w = (size(H, 2) - 1) * 4;
	
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