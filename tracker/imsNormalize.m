% imsNormalize
%	Converts RGB to normalized rgb or XYZ to normalized xyz.
%
% input:
%  I	Unnormalized image.
%
% output:
%  I	Normalized image.
%
function I = imsNormalize(I)

    % V, the sum of the channels for each pixel
    V = sum(I, 3);

    % An alternative:
    % V, the length of the vector for each pixel
    % V = sqrt(sum(I.^2, 3));
    
    % Each channel is divided by v, so v may never be 0.
    % v = 0 iff r=g=b=0. So we can change v to 1 in this case, because
    % r/v = g/v = b/v = 0/1 = 0
    V = V + (V == 0);

    % Divide each color channel by the length of the vector
	for i = 1:size(I, 3)
		I(:,:,i) = I(:,:,i) ./ V;
	end
end
