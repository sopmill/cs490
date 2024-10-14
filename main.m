a = imread("img_40.jpg");
desiredstd = 50;
desiredmu = 256;

[p] = gaussian(a, desiredstd, desiredmu);

subplot(2,3,1), imshow(a,[]);
title("Original Image");

subplot(2,3,2), imshow(p,[]);
title("Noisy Image");