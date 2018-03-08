function outputBlob = blobNoiseReduction( blob )
%BLOBNOISEREDUCTION Summary of this function goes here
%   Detailed explanation goes here
blobAreas = [blob.area];
newBlobIndex = 1;
    for area_index = 1:numel(blobAreas)
        if (blobAreas(area_index) > 2000)&& (blobAreas(area_index) < 2000000)
            outputBlob(newBlobIndex) =  blob(area_index);
            newBlobIndex = newBlobIndex +1;
        end
    end
end

