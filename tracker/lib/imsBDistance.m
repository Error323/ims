% imsBDistance - Compute the Bhattacharyya distance
%
% INPUTS:
%  - A, normalized vector A
%  - B, normalized vector B
%
% OUTPUTS:
%  - bD, the Bhattacharyya distance 
%  - bC, the Bhattacharyya coefficient

function [bD, bC] = imsBDistance(A, B)

	% Calculate Bhattacharyya coefficient
	bC = sum(sqrt(A .* B));

	% Compute the distance
	bD = -log(bC);

end