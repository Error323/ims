% imsBDistance(A, B) - Compute the Bhattacharyya distance
%
% INPUTS:
%  - A, matrix A
%  - B, matrix B
%
% OUTPUTS:
%  - bD, the Bhattacharyya distance 

function bD = imsBDistance(A, B)
	% Normalize A and B
	A = A ./ sum(sum(A));
	B = B ./ sum(sum(B));

	% Calculate Bhattacharyya coefficient
	bC = sum(sum(sqrt(A .* B)));

	% Compute the distance
	bD = -log(bC);
