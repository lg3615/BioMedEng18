
% show the annotation results
clear;clc;

% camera intrinsic parameters
CameraWidth = 960;
CameraHeight = 544;
FocalLengthY = 12*100; % I tried to multiply 12 by 100, through trial-and-error
FocalLengthX = 12*100;

% load the transformation matrix
load('RotationAndTranslation.mat');

% load joints' 3D locations
load('JointsLocs');

TotalNumber = size(JointsData, 1);

% figure to show the annotation 
figure(1);
% show the images
for f = 4 : 4 : TotalNumber

    points = JointsData(f,:);
    numofpoints = length(points)/3.0;
    points = reshape(points, [3, numofpoints]);

    % transform the data to camera coordinate system
    points = Rm*( - points + repmat(Tm, [1,numofpoints]));

    % convert the joints in world to pixel
    worldPosx = -points(1,:);
    worldPosy = points(2,:);
    worldPosz = points(3,:);

    u = worldPosx ./ worldPosz * ( FocalLengthX) + 0.5 * CameraWidth;
    v = worldPosy ./ worldPosz * ( FocalLengthY) + 0.5 * CameraHeight;
    d = worldPosz;

    pixelPosu = u;
    pixelPosv = v - 20; % manual addition
    pixelPosd = d;

    % load the images
    frameid = f/4 ;
    imgname = sprintf('Letizia130718_Oqus_7_17574/%06d.png', frameid);
    img = imread(imgname);

%     img = imresize(img, 2);
    clf;
    
    % show image
    imshow(img); hold on;
    % show the annotation
    plot(pixelPosu, pixelPosv, 'or');
    
    pause(0.1);
    
end

a = 1;

