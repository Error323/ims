% Close all figures
close all;

% Remove cached files
aFiles = dir ('cache');
for i = 1:length(aFiles)
	if aFiles(i).name(1) ~= '.';
		delete(['cache/' aFiles(i).name]);
	end
end

if exist('globals.mat', 'file')
	delete('globals.mat');
end
	
% Clear all global variables
clear all;
