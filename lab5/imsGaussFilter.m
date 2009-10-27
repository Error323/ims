% imsGaussFilter(d) - Computes normal distribution of a 2D grid
%
% INPUTS:
%  - h, the height of the filter
%  - w, the width of the filter
%  - S, standard deviation
%
% OUTPUTS:
%  - G, the 2d gaussian grid

function G = imsGaussFilter(h, w, S)

	x = (w + 1) / 2;
	y = (h + 1) / 2;
	
	G = zeros(h, w);
	
	for i = 1:w
		for j = 1:h
			G(j, i) = imsGauss([j, i], [y, x], S);
		end
	end
	
	G = G ./ sum(G(:));
	