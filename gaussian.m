% Team 255
% CS 490 DIP
% Spatial Gaussian Noise

function [g] = gaussian(a, std, mu)
  % a - input image
  % std - sigma
  % mu - mean value
  % g - output image

  n = zeros(size(a));
  n = double(a) + (std .* randn(size(a)) + mu);
  n = mat2gray(n); % Normalize to [0, 1]
  g = im2uint8(n); % Stretch to uint8 range
end