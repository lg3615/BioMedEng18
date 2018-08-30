function [ pixelPosu, pixelPosv, pixelPosd ] = convertWorld2PixelMat( worldPosx, worldPosy, worldPosz, CameraWidth, CameraHeight, FocalLengthX, FocalLengthY)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    u = worldPosx ./ worldPosz * (CameraWidth * FocalLengthX) + 0.5 * CameraWidth;
    v = worldPosy ./ worldPosz * (CameraHeight * FocalLengthY) + 0.5 * CameraHeight;
    d = worldPosz;

    pixelPosu = u;
    pixelPosv = v;
    pixelPosd = d;

end
