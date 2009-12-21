function K = imsKernel(h, aSize)

	height = aSize(1);
	width = aSize(2);
	
	[Xgrid, Ygrid] = meshgrid(-1:2/(width-1):1, -1:2/(height-1):1);
	
	c = pi * h^2;
	d = 2; % dimensions
	X = Xgrid.^2 + Ygrid.^2;
	
	K = 1/2 * c^-1 * (d + 2) * (1 - X);
	
	K = (X <= 1) .* K;
	
	K = K / sum(K(:));

