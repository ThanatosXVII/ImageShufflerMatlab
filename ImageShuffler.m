
% Edit Here
%Output Frame Rate
frameRate = 24;
%Input Folder of Images -- Within this folder another folder named images
%must contain all images
workingDir = 'big project';


mkdir(workingDir);
mkdir(workingDir,'images');

imageNames = dir(fullfile(workingDir,'images','*.jpg'));
imageNames = {imageNames.name}';

% This is my code
imagesRandom = imageNames(randperm(numel(imageNames)));
%
outputVideo = VideoWriter(fullfile(workingDir,'shuttle_out.avi'));
outputVideo.FrameRate = frameRate;
outputVideo.Quality = 100;
open(outputVideo)

for ii = 1:length(imagesRandom)
   img = imread(fullfile(workingDir,'images',imagesRandom{ii}));
   writeVideo(outputVideo,img)
end

 
close(outputVideo)
shuttleAvi = VideoReader(fullfile(workingDir,'shuttle_out.avi'));
ii = 1;
while hasFrame(shuttleAvi)
   mov(ii) = im2frame(readFrame(shuttleAvi));
   ii = ii+1;
end

figure(1);
imshow(mov(1).cdata, 'Border', 'tight');
movie(mov,1,shuttleAvi.FrameRate);