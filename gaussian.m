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
  g = uint8(n);
end