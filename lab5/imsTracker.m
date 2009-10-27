function [] = imsTracker(path)

	close all;

	fig = figure;
	frame = [path '/Frame' num2str(85, '%04d') '.png'];
	frame = im2double(imread(frame));
	imshow(frame);
	[x, y, w, h] = imsSelectObject();

	S = [(h/4)^2, 0; 0, (w/4)^2];
	K = imsGaussFilter(h, w, S);
	
	normFrame = imsNormalizeRgb(frame(y:y+h, x:x+w, :));
%	normFrame = frame(y:y+h, x:x+w, :);
	H = imsHistogram(normFrame, K, 4);
	
	movie = avifile(...
		'result.avi', ...
		'fps', 15, ...
		'quality', 100 ...
	); %	'Compression', 'Cinepack'

	for i=85:285
		frame = [path '/Frame' num2str(i, '%04d') '.png'];
		frame = im2double(imread(frame));
				
		fov = imsNormalizeRgb(frame(y-h:y+2*h, x-w:x+2*w, :));
%		fov = frame(y-h:y+2*h, x-w:x+2*w, :);
		
		[x1, y1] = imsFindObject(fov, H, [h,w]);
		x = x + round(x1 - w / 2) - w;
		y = y + round(y1 - h / 2) - h;
	
		imshow(frame);

		rectangle(...
			'Curvature', [1, 1], ...
			'Position', [x, y, w, h], ...
			'LineWidth', 3, ...
			'EdgeColor', 'c' ...
		);
		movie = addframe(movie, getframe(fig));
	end
	
	movie = close(movie);
end

