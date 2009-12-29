clear all
close all

aVideos = {'earth' , {'cheetah'}; 'soccer', {'orange', 'white'}};
aAxis = [0.6 3];
aBins = {64, 729, 4096, 15625};	
aColorSpaces = {'RGB', 'rgb', 'HSV', 'XYZ', 'xyz'};
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
			sStatsFile = ['result/' sVideo '_' sRegion '_' num2str(iBins) '.mat'];
			imsDebug(true, ['Loading statistics: ' sStatsFile]);
			load(sStatsFile);

			figSave = figure();
			hold on;
			for i = 1:length(aCsIdx)
				plot(STATS(aCsIdx(i), :)', aColors{i});
			end
			title([sVideo '\_' sRegion ', ' num2str(iBins) ' bins']);
			xlabel('frame number');
			ylabel('Bhatacharyya distance');
			legend(aColorSpaces, -1);
			axis([0 size(STATS, 2) 0 aAxis(v)]);
			drawnow;
			sPlotFile = ['result/' sVideo '_' sRegion '_' num2str(iBins) '.eps'];
			imsDebug(true, ['Saving image: ' sPlotFile]);
			saveas(figSave, sPlotFile, 'epsc'); 
			close(figSave);


			figure(figScreen);
			subplot(rows, cols, b);
			hold on;
			for i = 1:length(aCsIdx)
				plot(STATS(aCsIdx(i), :)', aColors{i});
			end
			title(['result/' sVideo '\_' sRegion ', ' num2str(iBins) ' bins']);
			xlabel('frame number');
			ylabel('Bhatacharyya distance');
			legend(aColorSpaces, 1);
			axis([0 size(STATS, 2) 0 aAxis(v)]);

		end
		figure(figScreen);
		drawnow;
	end
end

sVideoFile = 'result/earth_cheetah_32_rg.avi';
imsDebug(true, ['Loading video: ' sVideoFile]);
oMov = mmreader(sVideoFile);
disp(oMov);
imFrame1 = read(oMov, 80);
figure;
imshow(imFrame1);
sFrameFile = 'result/earth_cheetah.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame1, sFrameFile);

sVideoFile = 'result/soccer_orange_32_rg.avi';
imsDebug(true, ['Loading video: ' sVideoFile]);
oMov = mmreader(sVideoFile);
disp(oMov);
imFrame2 = read(oMov, 80);
figure;
imshow(imFrame2);
sFrameFile = 'result/soccer_orange.png';
imsDebug(true, ['Saving image: ' sFrameFile]);
imwrite(imFrame2, sFrameFile);

sVideoFile = 'result/soccer_white_32_rg.avi';
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
