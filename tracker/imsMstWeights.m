
function W = imsMstWeights(I, y, Q, P)

	global BINS TARGET_SIZE;

	% Extract object from frame
	xRange = round(y(2) - TARGET_SIZE(2) / 2:y(2) + TARGET_SIZE(2) / 2);
	yRange = round(y(1) - TARGET_SIZE(1) / 2:y(1) + TARGET_SIZE(1) / 2);
	I = I(yRange, xRange, :);
	
	I = imsNormalize(I);
	
	% Extract the red and green channels
    R = I(:,:,1);
    G = I(:,:,2);

	% Convert the values of R and G (0, 1) to indexes {0, ..., n}
    R = max(ceil(R .* BINS), 1);
    G = max(ceil(G .* BINS), 1);

	% Convert the twodimensional index <R,G> into a one dimensional index
	% X {0, ..., n^2}
	X = (R - 1) .* BINS + G;

	W = (Q(X) ./ P(X)).^(1/2);
	
	% Remove NaNs and Infs
	W(isnan(W)) = 0;
	W(isinf(W)) = 0;
	
end
