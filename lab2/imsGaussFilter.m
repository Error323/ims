% imsGaussFilter(d, mu, sigma) - Computes normal distribution of a 2D grid
%
% INPUTS:
%  - d, the dimensions of x and y
%  - mu, the mean
%  - sigma, the standard deviation
%
% OUTPUTS:
%  - Y, the 2d gaussian grid

function Y = imsGaussFilter(d, mu, sigma)
	Y = zeros(d,d);
	r = floor(d/2);
	for i = -r:r
		for j = -r:r
			Y(i+r+1,j+r+1) = imsGauss(sqrt(i*i+j*j), mu, sigma);
		end
	end

	Y = Y ./ imsGauss(0, mu, sigma);
