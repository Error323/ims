function testall()

	%% Preparation
	cleanup;
		
	% Load default globals
	globals;

	%% Configuration
	VISUAL_OUTPUT = false;
	DEBUG = {'TEST', 'STAT'};
	
	aVideos = {'earth' , {'cheetah'}; 'soccer', {'orange', 'white'}};
	aBins = {64, 729, 4096, 15625};	
	aColorSpaces = {'RGB', 'rg', 'HSV', 'HS', 'XYZ', 'xy'};

	%% Run tests	
	for v = 1:size(aVideos, 1)
		
		sVideo = aVideos{v, 1};
		
		aRegions = aVideos{v, 2};
		
		for r = 1:length(aRegions)
			
			sRegion  = aRegions{r};
			ROI_FILE = ['roi/' sVideo '_' sRegion '.mat'];
			
			for b = 1: length(aBins)

				BINS       = aBins{b};
				STATS_FILE = ['result/' sVideo '_' sRegion '_' num2str(BINS) '.mat'];

				for c = 1:length(aColorSpaces)
					
					COLOR_SPACE	 = aColorSpaces{c};
					RESULT_VIDEO = ['result/' sVideo '_' sRegion '_' num2str(BINS) '_' COLOR_SPACE '.avi'];
					
					save('cache/globals.mat', '-regexp', '^[A-Z_]+$');

					imsDebug('TEST', ['Starting test ' sVideo ':' sRegion ' (' num2str(BINS) ' bins, ' COLOR_SPACE ' space)']);

					iTimer = tic();
					tracker(['../data/' sVideo '.avi']);
					imsDebug('TEST', ['Test finished in ' num2str(toc(iTimer)) ' seconds']);

				end
			end
		end
	end	
end
