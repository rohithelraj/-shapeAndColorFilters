function binImg = binaryImageGenerator( img, binColor )
%BINARYIMAGEGENERATOR Summary of this function goes here
%   Detailed explanation goes here
    
    redChannel = img(:, :, 1);
    greenChannel = img(:, :, 2);
    blueChannel = img(:, :, 3);
    Y = redChannel+greenChannel+blueChannel;
    
    
    if strcmp(binColor,'blue')
       
       bnew = blueChannel./Y;
       blue = uint8(255 * bnew); 
       %idisp(blue);
       binImg = blue > 110;
    elseif strcmp(binColor,'red') 
       
       rnew = redChannel./Y;
       red = uint8(255 * rnew); 
       
       binImg = red > 110;
    elseif strcmp(binColor,'green')
       
       gnew = greenChannel./Y;
       green = uint8(255 * gnew); 
       
       binImg = green > 110;
       
    else
       disp('You have entered a wrong color. Please enter red, green or blue.'); 
    end
    
end

