% imsGauss(x, mu, sigma) - Computes normal distribution
%
% INPUTS:
%  - x
%  - mu, the mean
%  - sigma, the standard deviation
%
% OUTPUTS:
%  - y

function y = imsGauss(x, mu, sigma)
    y = ( 1 / ( sigma * sqrt(2*pi) ) ) * exp(-( (x-mu)^2 / (2*sigma^2) ) );
