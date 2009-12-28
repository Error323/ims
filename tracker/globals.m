	% SETTINGS
global DEBUG BINS CACHE COLOR_SPACE;

% debug modes
% IMAQ - Image aquisition
% TGSL - Target selection
% KRNL - Kernel calculations
% HIST - Histogram calculations

DEBUG = 'IMAQ';			% Debug mode {false, true, 'IMAQ', 'TGSL', 'KRNL', 'HIST'}
CACHE = true;			% Enable caching
BINS = 1000;			% Approximate number of bins in the histogram.
EPSILON = 1;
COLOR_SPACE = 'rg';		% Color space {'RGB', 'rg', 'HSV', 'HS', 'XYZ', 'xy'}

% RUNTIME VARIABLES
global VIDEO_FRAMES VIDEO_FILES TARGET_SIZE KERNELS;

VIDEO_FRAMES = 0;		% Number of video frames
VIDEO_FILES = {};		% A list of video frames (files)
TARGET_SIZE = [0 0];	% Target size (h w)
KERNELS = struct();		% Cached kernels
