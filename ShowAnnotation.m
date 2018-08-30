
% show the annotation results
clear;clc;

% camera intrinsic parameters
CameraWidth = 960*2;
CameraHeight = 544*2;
FocalLengthY = 12*200;
FocalLengthX = 12*200;

% load the transformation matrix
load('RotationAndTranslation.mat');

%points = [128.595	92.504	139.532	113.261	136.756	125.629	116.375	168.248	117.180	113.135	191.281	112.972	163.017	91.899	151.677	171.921	156.216	131.100	181.629	201.617	117.249	190.174	224.740	105.872	196.920	242.860	100.407	189.557	147.480	130.875	213.545	187.972	114.542				242.901	223.773	93.941	200.256	133.089	127.340	235.087	165.230	111.074	265.343	195.971	97.624	253.167	180.101	101.078	207.131	120.492	121.719	238.486	129.414	112.173	258.808	137.467	105.941	273.877	148.185	101.031];

points = [110.598	69.486	142.897	90.257	110.916	126.077	87.189	140.326	115.416	78.014	160.527	112.312	146.247	71.322	152.402	149.111	134.954	129.436	150.757	181.299	118.159	155.219	206.508	109.460	158.538	225.900	105.879	167.890	127.060	128.014	188.429	168.277	112.154				216.353	207.239	99.757	179.209	112.609	123.846	213.189	144.239	108.355	243.482	175.195	95.324	231.210	159.334	98.224	186.149	99.980	117.387	216.616	107.434	103.672	236.345	114.555	96.044	251.663	124.572	90.778];

size(points);
points = reshape(points, [3, length(points)/3.0]);

% transform the data

points = Rm*( - points + repmat(Tm, [1,20]));

% convert the joints in world to pixel
%[ pixelPosu, pixelPosv, pixelPosd ] = 
%convertWorld2PixelMat( worldPosx, worldPosy, worldPosz, CameraWidth, CameraHeight, FocalLengthX, FocalLengthY);
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
worldPosx = -points(1,:);
worldPosy = points(2,:);
worldPosz = points(3,:);

u = worldPosx ./ worldPosz * ( FocalLengthX) + 0.5 * CameraWidth;
v = worldPosy ./ worldPosz * ( FocalLengthY) + 0.5 * CameraHeight;
d = worldPosz;


pixelPosu = u;
pixelPosv = v-50;
pixelPosd = d;


% % load joints' 3D locations
% load('JointsLocs');

figure(1);
for i = 48 : 4000
% show the images
    frameid = i;
    imgname = sprintf('Letizia130718_Oqus_7_17574/%06d.png', frameid);
    img = imread(imgname);
    %imshow(img);
    % size(img)
    % img = imresize(img, [1088,1920]);
    img = imresize(img, 2);
    clf;
    
    % show image
    imshow(img); hold on;
    % show the annotation
    plot(u, v, 'or');
    
    pause(0.1);
    
end

a = 1;

