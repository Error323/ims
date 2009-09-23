% imsGaussFilter(d, mu, sigma) - Computes normal distribution of a 2D grid
%
% INPUTS:
%  - d, the dimensions of x and y
%  - mu, the mean
%  - sigma, the standard deviation
%
% OUTPUTS:
%  - G, the 2d gaussian grid

function G = imsGaussFilter(d, mu, sigma)
	G = zeros(d,d);
	r = floor(d/2);
	for i = -r:r
		for j = -r:r
			G(i+r+1,j+r+1) = imsGauss(sqrt(i*i+j*j), mu, sigma);
		end
	end

	G = G ./ imsGauss(0, mu, sigma);
	
	Gmin = max(G(:,1));
	G = (G >= Gmin) .* G;
