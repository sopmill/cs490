% Team 255
% Digital Image Processing Final Project

% Load dataset folder
imds = imageDatastore("dataset/*.jpg");
% Store images from dataset in array
imgs = readall(imds);

% Preallocate statistic vectors
mse = zeros(75,2);
psn = zeros(75,2);
ent = zeros(75,3);
ssi = zeros(75,2);
rng = zeros(75,3);

% Standard Deviation affects how noisy the resulting image is
desiredstd = 64;

% Mean affects how bright the resulting image is
desiredmu = 256;

% Slice size is the side length of the square of pixels 
% used to calculate the median
% Must be odd otherwise there's no middle pixel to change
sliceSize = 255;

% Salt and Pepper Noise Density
dens = 0.08;

% Speckle Noise Variance
var = 0.08;

for i=1:size(imgs(:))
    a = imgs{i};

    % Comment out each noise type except the one you want to use

    % Add gaussian noise
    p = gaussian(a, desiredstd, desiredmu);

    % Add salt & pepper noise
    %p = imnoise(a, "salt & pepper", dens);

    % Add speckle noise
    %p = imnoise(a, "speckle", var);

    % Add poisson noise
    %p = poissrnd(double(a));

    % Apply median filter
    [m1] = Median_Filter(p, sliceSize);

    p = mat2gray(p); % Normalize to [0, 1]
    p = im2uint8(p); % Stretch to uint8 range

    m1 = mat2gray(m1); % Normalize to [0, 1]
    m1 = im2uint8(m1); % Stretch to uint8 range

    % Save to folder
    %imgtitle = strcat("mpimg_" + i + ".jpg");
    %imwrite(m1, imgtitle)

    mse(i,1) = immse(p, a);
    mse(i,2) = immse(m1, a);

    psn(i,1) = psnr(p, a);
    psn(i,2) = psnr(m1, a);

    ent(i,1) = entropy(a);
    ent(i,2) = entropy(p);
    ent(i,3) = entropy(m1);

    ssi(i,1) = ssim(p, a);
    ssi(i,2) = ssim(m1, a);

    rng(i,1) = max(max(a))-min(min(a));
    rng(i,2) = max(max(p))-min(min(p));
    rng(i,3) = max(max(m1))-min(min(m1));
end