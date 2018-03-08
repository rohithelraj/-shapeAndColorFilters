function calibrationCircleBlob = getCalibrationCircles( blueBinary )
%GETCALIBRATIONCIRCLES Summary of this function goes here
%   Detailed explanation goes here
    blue_blobs = iblobs(blueBinary,'boundary');
    goodblueBlobs = blobNoiseReduction(blue_blobs);
    circle_index = 1;    
    for shape_index = 1:numel(goodblueBlobs)
            if (goodblueBlobs(shape_index).circularity_ > 0.960)
                    calibrationCircleBlob(circle_index) = goodblueBlobs(shape_index);
                    circle_index = circle_index + 1;
             end 
    end    
end

