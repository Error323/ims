% imsNormalizeValues() - Shifts all values in a matrix so the lowest value
% will be 0 and the highes will be 1
%
%	INPUTS:
%	 - I, input matrix
%
%	OUTPUTS:
%	 - I, normalized matrix
%

function I = imsNormalizeValues(I)
Min = min(I(:));
Max = max(I(:));

if (Min == Max)
	Max = Min + 1;
end

I = (I - Min) / (Max - Min);
