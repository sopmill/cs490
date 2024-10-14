% Group 255
% Project: Image Denoising Through Midpoint Filter and Scaling 

function [r] = Median_Filter(img, slice)
    [row, col] = size(img);
    fimg = zeros(row, col);
    for i = 2:row-1
        for j = 2:col-1
            flt=[img(i-1,j-1),img(i-1,j),img(i-1,j+1),img(i,j-1),img(i,j),img(i,j+1),img(i+1,j-1),img(i+1,j),img(i+1,j+1)];
            fimg(i,j)=median(flt);
        end
    end

    r = fimg;

end

