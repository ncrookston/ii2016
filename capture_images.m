function [ imgs ] = capture_images( c, N )
%CAPTURE_IMAGES Captures N images into an N x c.aoi(3) x c.aoi(4) matrix
imgs = zeros(N, c.aoi(3), c.aoi(4));
for i=1:N
    imgs(i,:,:) = c.capture';
end


end

