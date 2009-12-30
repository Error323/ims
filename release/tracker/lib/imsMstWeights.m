% imsMstWeights - Calculate the weights
%
% INPUT:
%  - I, frame
%  - y, position
%  - Q, target model
%  - P, current model
%
% OUTPUTS:
%  - W, Weight matrix
%
function W = imsMstWeights(I, y, Q, P)

	global TARGET_SIZE;

	% Extract object from frame
	xRange = round(y(2) - (TARGET_SIZE(2)-1) / 2:y(2) + (TARGET_SIZE(2)-1) / 2);
	yRange = round(y(1) - (TARGET_SIZE(1)-1) / 2:y(1) + (TARGET_SIZE(1)-1) / 2);
	if (min(xRange) > 0 && max(xRange) <= size(I, 2) && min(yRange) > 0 && max(yRange) <= size(I, 1)) 
		I = I(yRange, xRange, :);
	else
		W = zeros(length(yRange), length(xRange));
		return;
	end
	
	% Get the index of each pixel
	X = imsPixelsToBins(I);
	X = reshape(X, size(I, 1), size(I, 2));
	
	W = (Q(X) ./ P(X)).^(1/2);
	
	% Remove NaNs and Infs
	W(isnan(W)) = 0;
	W(isinf(W)) = 0;
	
end
