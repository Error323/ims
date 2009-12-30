clear all
close all

aVideos = {'earth' , {'cheetah'}; 'soccer', {'orange', 'white'}};
aAxis = [300 300];
aBins = {64, 729, 4096, 15625};	
aColorSpaces = {'RGB', 'rg', 'HSV', 'XYZ', 'xy'};
aColorLabels = {'RGB', 'rgb', 'HSV', 'XYZ', 'xyz'};
aCsIdx = [1, 2, 3, 5, 6];
aColors = {'r', 'm', 'b', 'c','g'};

for v = 1:size(aVideos, 1)
	sVideo = aVideos{v, 1};
	aRegions = aVideos{v, 2};
	for r = 1:length(aRegions)
		sRegion = aRegions{r};
		S = [];
		figScreen = figure();
		rows = floor(length(aBins)^(1/2));
		cols = ceil(length(aBins) / rows);
		for b = 1:length(aBins)
			iBins = aBins{b};
			figSave = figure();
			hold on;

			figure(figScreen);
			subplot(rows, cols, b);
			hold on;
			
			for i = 1:length(aCsIdx)
				sColorSpace = aColorSpaces{i};
				sStatsFile = ['result/' sVideo '_' sRegion '_' num2str(iBins) '_' sColorSpace '.mat'];
				imsDebug(true, ['Loading statistics: ' sStatsFile]);
				load(sStatsFile);
				load(['groundtruth/' sVideo '_' sRegion '.mat']);

				dist = sum((STATS - Y).^2, 2).^0.5;
				
				figure(figSave);
				plot(dist, aColors{i}, 'LineWidth', 2);

				figure(figScreen);
				plot(dist, aColors{i});

			end
			
			figure(figSave);
			xlabel('frame number');
			ylabel('Euclidean distance');
			legend(aColorLabels, 1);
			axis([0 size(STATS, 1) 0 aAxis(v)]);
			drawnow;
			sPlotFile = ['result/' sVideo '_' sRegion '_' num2str(iBins) '.eps'];
			imsDebug(true, ['Saving image: ' sPlotFile]);
			saveas(figSave, sPlotFile, 'epsc'); 
			close(figSave);
			
			figure(figScreen);
			axis([0 size(STATS, 1) 0 aAxis(v)]);
			title([sVideo '\_' sRegion ', ' num2str(iBins) ' bins']);
			xlabel('frame number');
			ylabel('Euclidean distance');
			legend(aColorLabels, 1);

		end
		figure(figScreen);
		sPlotFile = ['result/' sVideo '_' sRegion '.eps'];
		imsDebug(true, ['Saving image: ' sPlotFile]);
		saveas(figScreen, sPlotFile, 'epsc'); 
		drawnow;
	end
end

sVideoFile = 'result/earth_cheetah_4096_rg.avi';
imsDebug(true, ['Loading video: ' sVideoFile]);
oMov = mmreader(sVideoFile);
disp(oMov);
imFrame1 = read(oMov, 80);
figure;
imshow(imFrame1);
sFrameFile = 'result/earth_cheetah.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame1, sFrameFile);

sVideoFile = 'result/soccer_orange_4096_rg.avi';
imsDebug(true, ['Loading video: ' sVideoFile]);
oMov = mmreader(sVideoFile);
disp(oMov);
imFrame2 = read(oMov, 80);
figure;
imshow(imFrame2);
sFrameFile = 'result/soccer_orange.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame2, sFrameFile);

sVideoFile = 'result/soccer_white_4096_rg.avi';
imsDebug(true, ['Loading video: ' sVideoFile]);
oMov = mmreader(sVideoFile);
disp(oMov);
imFrame3 = read(oMov, 80);
figure;
imshow(imFrame3);
sFrameFile = 'result/soccer_white.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame3, sFrameFile);

imFrame4 = [imFrame2(:, 1:360, :), imFrame3(:, 361:720, :)];
figure;
imshow(imFrame4);
sFrameFile = 'result/soccer.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame4, sFrameFile);
