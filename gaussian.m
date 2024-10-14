% Team 255
% CS 490 DIP
% Spatial Gaussian Noise

function [g] = gaussian(a, std, mu)
  % a - input image
  % std - sigma
  % mu - mean value
  % g - output image

  % n - noise matrix
  n = zeros(size(a));
  p = pi;

  for row=1:size(n, 1)
    for col=1:size(n,2)
        expNumerator = (2 .* (std.^2));
        expDenominator = (double(a(row, col)) - mu).^2;
        exponent = (expNumerator ./ expDenominator) .* -1;
        e = exp(exponent);
        fraction = (1 / (std * sqrt(2 * p)));

        n(row, col) = fraction .* e;
    end
  end

  g(:) = a(:) + (sqrt(std.^2)*randn(size(a)) + mu);
  %g = (double(a) + n);
  

end