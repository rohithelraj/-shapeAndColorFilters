img = iread('roboticRecognitorjpg_Page1.jpg','double');
limg = igamm(img, 'sRGB');%gamma correction.
[r,g] = tristim2cc(limg);%chromaticity values.Already used in binary image generation.
redBinary = binaryImageGenerator(img,'red');
blueBinary = binaryImageGenerator(img,'blue');
greenBinary = binaryImageGenerator(img,'green');
idisp({blueBinary,redBinary,greenBinary,img});


red_blobs = iblobs(redBinary,'boundary');
green_blobs = iblobs(greenBinary,'boundary');
blue_blobs = iblobs(blueBinary,'boundary');

goodredBlobs = blobNoiseReduction(red_blobs);
goodblueBlobs = blobNoiseReduction(blue_blobs);
goodgreenBlobs = blobNoiseReduction(green_blobs);
goodredBlobs.plot_box;
goodblueBlobs.plot_box;
goodgreenBlobs.plot_box;


detected = getShape(goodredBlobs,'circle','small');
idisp({redBinary,img});
detected.plot_box;

calibration_circles = getCalibrationCircles(blueBinary);
idisp({limg});
calibration_circles.plot_boundary;
calibration_circles.plot('r*');

p1 = [1473 1925;797 1921;115 1924;115 1244;114 568;794 569;1475 568;1474 1244;794 1245];
p1 = p1';
