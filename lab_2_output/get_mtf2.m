function get_mtf2( img, aoi )
%GET_MTF2 Summary of this function goes here
%   Detailed explanation goes here

imgr = img(aoi(1):aoi(3),aoi(2):aoi(4));
imgr = imgr / max(imgr(:));

ibw = edge(imgr,'canny');
[H,theta,rho] = hough(ibw);
peaks = houghpeaks(H,1);
lines = houghlines(ibw,theta,rho,peaks);

figure,imagesc(ibw),colorbar;
hold on
xy = [lines(1).point1; lines(1).point2];
disp(xy)
plot(xy(:,1), xy(:,2), 'Color','g', 'LineWidth',2);

hold off

l = xy(2,:) - xy(1,:);
a = acos(dot(l,[1 0]) / norm(l));

figure,imagesc(imrotate(imgr,-radtodeg(a),'crop'))
rimg = radon(ibw, 90-radtodeg(a));
figure,plot(rimg);

end

