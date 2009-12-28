% SETTINGS
global DEBUG BINS CACHE COLOR_SPACE;

% debug modes
% IMAQ - Image aquisition
% TGSL - Target selection
% KRNL - Kernel calculations
% HIST - Histogram calculations
% TEST - Test cycles

DEBUG = 'IMAQ';
CACHE = true;			% Enable caching
BINS = 16;				% Number of bins per dimension.
EPSILON = 1;
COLOR_SPACE = 'rg';		% Color space {'RGB', 'rg', 'HSV', 'HS', 'XYZ', 'xy'}


% FILES
global VISUAL_OUTPUT ROI_FILE RESULT_VIDEO STATS_FILE;

VISUAL_OUTPUT = true;
ROI_FILE = 'cache/roi.mat';
RESULT_VIDEO = 'result/result.avi';
STATS_FILE = 'result/stats.mat';


% RUNTIME VARIABLES
global VIDEO_FRAMES VIDEO TARGET_SIZE KERNELS STATS;

VIDEO_FRAMES = 0;		% Number of video frames
VIDEO = {};				% A list of video frames (files)
TARGET_SIZE = [0 0];	% Target size (h w)
KERNELS = struct();		% Cached kernels
STATS = [];


% LOAD DYNAMIC GLOBALS
if exist('globals.mat', 'file')
	load('globals.mat');
end
