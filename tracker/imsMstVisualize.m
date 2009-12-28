function imsMstVisualize(I, q, p, y, bD)

	global TARGET_SIZE;

	x1 = floor(y(2) - TARGET_SIZE(2) / 2); 
	x2 =  ceil(y(2) + TARGET_SIZE(2) / 2); 
	y1 = floor(y(1) - TARGET_SIZE(1) / 2); 
	y2 =  ceil(y(1) + TARGET_SIZE(1) / 2); 
	I(y1:y2, x1:x2, 3) = 1;

	clf;
	
	subplot(2,3,[1 2 4 5]);
	imshow(I);

%	axis([1 size(I, 2) 1 size(I, 1)])
%	hold on;
%	rectangle( ...
%		'Position', [y(2) - TARGET_SIZE(2)/2, y(1) - TARGET_SIZE(1)/2, TARGET_SIZE(2), TARGET_SIZE(1)], ...
%		'Curvature', [1, 1], ...
%		'EdgeColor', 'white', ...
%		'LineWidth', 2);

	subplot(2,3,3);
	imsShowHistogram(q, 2);

	subplot(2,3,6);
	imsShowHistogram(p, 2);

	drawnow;
end
