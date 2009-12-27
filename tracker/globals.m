% SETTINGS
global DEBUG BINS CACHE;

% debug modes
% IMAQ - Image Aquisition
% TGSL - Target Selection

DEBUG = true;	% Debug mode {false, true, 'IMAQ', 'TGSL'
CACHE = true;	% Enable caching
BINS = 32;		% Number of bins in the histogram. Note that the total number of bins is BINS^2.


% RUNTIME VARIABLES
global VIDEO_FRAMES KERNELS;

VIDEO_FRAMES = {};		% A list of video frames (files)
KERNELS = struct();			% Cached kernels
