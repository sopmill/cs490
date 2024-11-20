% Load dataset folder
imds = imageDatastore("dataset/*.jpg");
% Store images from dataset in array
imgs = readall(imds);
% To use: change number within curly brackets to desired image number
a = imgs{9};

% Standard Deviation affects how noisy the resulting image is
desiredstd = 64;

% Mean affects how bright the resulting image is
desiredmu = 256;

% Slice size is the side length of the square of pixels 
% used to calculate the median
% Must be odd otherwise there's no middle pixel to change
sliceSize = 5;

% Salt and Pepper Noise Density
dens = 0.08;

% Speckle Noise Variance
var = 0.08;


subplot(3,3,1), imshow(a,[]);
title("Original Image");

% Add gaussian noise
[p] = gaussian(a, desiredstd, desiredmu);

subplot(3,3,2), imshow(p,[]);
description = strcat("σ = ", string(desiredstd), ", μ = ", string(desiredmu));
title({"Gaussian Noise", description});

% Apply median filter
[m1] = Median_Filter(p, sliceSize);

subplot(3,3,3), imshow(m1,[]);
description = strcat(string(sliceSize), "x", string(sliceSize), " slice");
title({"Median Filtered", description});




subplot(3,3,4), imshow(a,[]);
title("Original Image");

% Apply salt and pepper noise
sp = imnoise(a, "salt & pepper", dens);

subplot(3,3,5), imshow(sp,[]);
description = strcat("density = ", string(dens));
title({"S&P Noise", description});

% Apply median filter
[m2] = Median_Filter(sp, sliceSize);

subplot(3,3,6), imshow(m2,[]);
description = strcat(string(sliceSize), "x", string(sliceSize), " slice");
title({"Median Filtered", description});




subplot(3,3,7), imshow(a,[]);
title("Original Image");

% Apply salt and pepper noise
speck = imnoise(a, "speckle", var);

subplot(3,3,8), imshow(speck,[]);
description = strcat("variance = ", string(var));
title({"Speckle Noise", description});

% Apply median filter
[m3] = Median_Filter(speck, sliceSize);

subplot(3,3,9), imshow(m3,[]);
description = strcat(string(sliceSize), "x", string(sliceSize), " slice");
title({"Median Filtered", description});