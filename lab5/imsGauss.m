% imsGauss(x, mu, sigma) - Computes normal distribution
%
% INPUTS:
%  - X
%  - U, the mean
%  - S, the standard deviation
%
% OUTPUTS:
%  - G

function G = imsGauss(X, U, S)

	X = reshape(X, [], 1);
	U = reshape(U, [], 1);
	
	D = 1 / sqrt(det(2 * pi * S));
	E = exp(-1/2 * (X-U)' * (S^-1) * (X-U));
	G = D * E;
		
