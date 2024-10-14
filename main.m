a = imread("img_40.jpg");

% Standard Deviation affects how noisy the resulting image is
desiredstd = 32;
% Mean affects how bright the resulting image is
desiredmu = 32;

% Add gaussian noise
[p] = gaussian(a, desiredstd, desiredmu);

subplot(1,3,1), imshow(a,[]);
title("Original Image");

subplot(1,3,2), imshow(p,[]);
title("Noisy Image");

[m] = Median_Filter(p, 5);

subplot(1,3,3), imshow(m,[]);
title("Median Filtered Image");