% Team 255
% CS 490 DIP
% Median Filter

function [r] = Median_Filter(img, slice)
    % img - original image
    % slice - desired side length of the bounding square

    imgSize = size(img); % Saved as variable to not recompute each time
    filteredImg = zeros(imgSize);

    if mod(slice, 2) == 0
        % No middle pixel on a non-odd slice
        disp("Error: Slice dimensions cannot be even")
        return
    else
        % Odd slice dimensions eg. 3x3
        halfSlice = floor(slice ./ 2);
    end

    % Creates a matrix of the relative X and Y offsets to the center
    % for each coordinate of a slice
    [X, Y] = meshgrid(-halfSlice:halfSlice, -halfSlice:halfSlice);

    % Combines the offset matrices into a list containing every
    % possible dX and dY combination
    adjacency = [X(:), Y(:)];   

    for i = 1:imgSize(1)
        for j = 1:imgSize(2)
            % Empty the valid array for each slice
            valid = [];
            for k = 1:slice^2 % Slice^2 is the max amt of values in a slice
                % Add the dX and dY to the middle pixel using adjacency matrix
                imgX = i + adjacency(k, 1);
                imgY = j + adjacency(k, 2);

                % Check if the offset pixel coordinates are valid
                if checkOutOfBounds(imgSize, imgX, imgY)
                    continue % If not, go to next iteration
                else
                    % Adds value @ the validated coordinates to back of list
                    valid(end + 1) = img(imgX, imgY);
                end
            end

            % Using floor to round down since sometimes valid array can be
            % of even length which results in median vals with an extra 0.5
            filteredImg(i,j) = floor(median(valid));
        end
    end

    % Copy the final filtered image to the output
    r = filteredImg;
    r = mat2gray(r); % Normalize to [0, 1]
    r = im2uint8(r); % Stretch to uint8 range

end


function outOfBounds = checkOutOfBounds(size, rowIndex, colIndex)
% Returns true if the coordinates are out of the bounds of the image
    outOfBounds = rowIndex < 1 || rowIndex > size(1) || ...
                  colIndex < 1 || colIndex > size(2);
end