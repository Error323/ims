% imsKernel - Construct a kernel of size aSize
%   Note that the values sum up to one.
%
% INPUT:
%  - aSize, a vector [height, width]
%
% OUTPUT:
%  - K, an height * width image containing the kernel
%
function K = imsKernel(aSize)

	global CACHE KERNELS;
	
	if (CACHE)
		if (isempty(fieldnames(KERNELS)) && exist('cache/imsKernels.mat', 'file'))
			load('cache/imsKernels.mat');
			imsDebug('KRNL', [num2str(length(fieldnames(KERNELS))) ' kernels loaded from file.']);
		end
		sCacheIdx = ['K_' num2str(aSize(2)) 'x' num2str(aSize(1))];
		if sum(ismember(fieldnames(KERNELS), sCacheIdx))
			imsDebug('KRNL', ['Kernel ' num2str(aSize(2)) 'x' num2str(aSize(1)) ' loaded from cache.']);
			K = KERNELS.(sCacheIdx);
			return
		end
	end

	% The number of dimensions (2)
	d = 2;
	
	% The scale is always 1 because we scale the valuas of our grid with
	% respect to the dimensions of the grid.
	h = 1;

	% Extract the dimensions.
	height = aSize(1);
	width = aSize(2);
	
	% Create an X, Y grid.
	[Xgrid, Ygrid] = meshgrid(-1:2/(width-1):1, -1:2/(height-1):1);

	% Calculate c
	c = pi * h^2;
	
	% Calculate the squared distance measure X
	X = Xgrid.^2 + Ygrid.^2;

	% Calculate the Bath kernel
	K = 1/2 * c^-1 * (d + 2) * (1 - X);

	% The kernel is only defined for pixels with distance <= 1 to the
	% center of the kernel
	K = (X <= 1) .* K;

	% Normalize the kernel so all values sum up to one.
	K = K / sum(K(:));

	if CACHE
		KERNELS.(sCacheIdx) = K;
		save('cache/imsKernels.mat', 'KERNELS');
	end
	
	imsDebug('KRNL', ['Kernel ' num2str(aSize(2)) 'x' num2str(aSize(1)) ' calculated.']);
end