% imsHistogram() - Converts RGB to normalized rgb (Lab 1)
%
%	INPUTS:
%	 - I, NORMALIZED RGB image
%	 - M, mask (gray values)
%	 - n, the histogram will contain n*n bins
%
%	OUTPUTS:
%	 - H, Histogram, a matrix of n*n values wich sum up to 1
%

function H = imsHistogram(I, M, n)

R = I(:,:,1);
G = I(:,:,2);

R = R(M > 0);
G = G(M > 0);
M = M(M > 0);

H = zeros(n);

for r = 1:n
	for g = 1:n
		Sr = (R > (r-1) / n) & (R <= r / n);
		Sg = (G > (g-1) / n) & (G <= g / n);
		S = Sr & Sg;
		H(r,g) = sum(S .* M);
	end
end

H = H / sum(H(:));