% Load dataset folder
imds = imageDatastore("dataset/*.jpg");
% Store images from dataset in array
imgs = readall(imds);
% To use: change number within curly brackets to desired image number
a = imgs{1};

% Standard Deviation affects how noisy the resulting image is
desiredstd = 32;

% Mean affects how bright the resulting image is
desiredmu = 32;

% Slice size is the side length of the square of pixels 
% used to calculate the median
% Must be odd otherwise there's no middle pixel to change
sliceSize = 5;


% Add gaussian noise
[p] = gaussian(a, desiredstd, desiredmu);

subplot(1,3,1), imshow(a,[]);
title("Original Image");

subplot(1,3,2), imshow(p,[]);
title("Noisy Image");

% Apply median filter
[m] = Median_Filter(p, sliceSize);

subplot(1,3,3), imshow(m,[]);
title("Median Filtered Image");