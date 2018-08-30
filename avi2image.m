
% 
% obj = mmreader('Letizia130718_Oqus_7_17574.avi');
% vid = read(obj);
% frames = obj.NumberOfFrames;
% for x = 1 : frames
%     imwrite('Letizia130718_Oqus_7_17574/',strcat('frame-',num2str(x),'.tif'));
% end


% Extract the images from the video
clear;clc;

% read the video file
inputfilename = 'LetiziaVideo_Oqus_7_17574.avi';
vid=VideoReader(inputfilename);
numFrames = vid.NumberOfFrames;

% save images
for iFrame = 1:numFrames
  frames = read(vid, iFrame);
  imwrite(frames, fullfile('LetiziaVideo_Oqus_7_17574/', sprintf('%06d.png', iFrame)));
end 
