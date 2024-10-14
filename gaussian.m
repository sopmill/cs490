% Team 255
% CS 490 DIP
% Spatial Gaussian Noise

function [g] = gaussian(a, std, mean)
  % a - input image
  % std - sigma
  % mean - mean value
  % g - output image

  % n - noise matrix
  n = zeros(size(a));
  p = pi;

  for row=1:size(n, 1)
    for col=1:size(n,2)
        exponent = double((((a(row, col) - mean).^2) / ((2*std).^2)) * -1);
        e = exp(exponent);
        fraction = (1 / sqrt(2 * p));

        n(row, col) = fraction * e;
    end
  end

  g = a + n;

end