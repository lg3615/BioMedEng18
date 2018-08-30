function [ worldPosx, worldPosy, worldPosz ] = convertPixel2WorldMat( pixelPosu, pixelPosv, pixelPosd, u, v, FocalLengthX, FocalLengthY )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    u0= 315.944855;%311.466095;%320 
    v0= 245.287079;
    
    pixelPosu=pixelPosu-u0;
    pixelPosv=pixelPosv-v0;
    
    x = ((pixelPosu) .* pixelPosd) / (FocalLengthX);
    y = ((pixelPosv) .* pixelPosd) / (FocalLengthY);
    z = pixelPosd;
    
    worldPosx = x;
    worldPosy = y;
    worldPosz = z;
end
