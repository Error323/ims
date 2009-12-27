% SETTINGS
global DEBUG BINS CACHE COLOR_SPACE;

% debug modes
% IMAQ - Image aquisition
% TGSL - Target selection
% KRNL - Kernel calculations

DEBUG = true;		% Debug mode {false, true, 'IMAQ', 'TGSL', 'KRNL'}
CACHE = true;		% Enable caching
BINS = 16;			% Number of bins in the histogram. Note that the total number of bins is BINS^2.
EPSILON = 1;
COLOR_SPACE = 'rg';	% Color space {'RG', 'rg', 'HS', 'HI', 'XY', 'xy'}

% RUNTIME VARIABLES
global VIDEO_FRAMES VIDEO_FILES TARGET_SIZE KERNELS;

VIDEO_FRAMES = 0;		% Number of video frames
VIDEO_FILES = {};		% A list of video frames (files)
TARGET_SIZE = [0 0];	% Target size (h w)
KERNELS = struct();		% Cached kernels
