function detectedBlob = getShape( shapesBlob,shape,size )
%GETSHAPE Summary of this function goes here
%   Detailed explanation goes here
    square_index = 1;
    circle_index = 1;
    traingle_index = 1;
    for shape_index = 1:numel(shapesBlob)
        if strcmp(shape,'circle')
            if (shapesBlob(shape_index).circularity_ > 0.960)
                circleBlob(circle_index) = shapesBlob(shape_index);
                circle_index = circle_index + 1;
            end        
        elseif strcmp(shape,'square') 
            if (shapesBlob(shape_index).theta == 0.00)
                squareBlob(square_index) = shapesBlob(shape_index);
                square_index = square_index + 1;
            end
        elseif strcmp(shape,'triangle')    
            if ~(shapesBlob(shape_index).circularity_ > 0.960)
                if ~(shapesBlob(shape_index).theta == 0.00)
                    triangleBlob(traingle_index) = shapesBlob(shape_index);
                    traingle_index = traingle_index + 1;
                end                
            end
        end
        
    end
    if strcmp(shape,'circle')
        circleBlobAreas = [circleBlob.area];
        maxCircleArea = max(circleBlobAreas);
        if strcmp(size,'small')
            detect_index = 1;
            for blob_index = 1:numel(circleBlob)
                if maxCircleArea ~= circleBlobAreas(blob_index)
                    detectedBlob(detect_index) = circleBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end    
        elseif strcmp(size,'large') 
            detect_index = 1;
            for blob_index = 1:numel(circleBlob)
                if maxCircleArea == circleBlobAreas(blob_index)
                    detectedBlob(detect_index) = circleBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end
        end        
    elseif strcmp(shape,'square') 
        squareBlobAreas = [squareBlob.area];
        maxSquareArea = max(squareBlobAreas);
        if strcmp(size,'small')
            detect_index = 1;
            for blob_index = 1:numel(squareBlob)
                if maxSquareArea ~= squareBlobAreas(blob_index)
                    detectedBlob(detect_index) = squareBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end
        elseif strcmp(size,'large') 
            detect_index = 1;
            for blob_index = 1:numel(squareBlob)
                if maxSquareArea == squareBlobAreas(blob_index)
                    detectedBlob(detect_index) = squareBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end
        end        
    elseif strcmp(shape,'triangle')    
        triangleBlobAreas = [triangleBlob.area];
        maxTriangleArea = max(triangleBlobAreas);
        if strcmp(size,'small')
            detect_index = 1;
            for blob_index = 1:numel(triangleBlob)
                if maxTriangleArea ~= triangleBlobAreas(blob_index)
                    detectedBlob(detect_index) = triangleBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end
        elseif strcmp(size,'large') 
            detect_index = 1;
            for blob_index = 1:numel(triangleBlob)
                if maxTriangleArea == triangleBlobAreas(blob_index)
                    detectedBlob(detect_index) = triangleBlob(blob_index);
                    detect_index = detect_index + 1;
                end    
            end
        end        
    end


end

