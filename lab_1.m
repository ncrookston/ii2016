
if ~exist('c','var')
    c = MockCamera(0, 'lens on');
end
%Assumes c has been initialized to Camera or MockCamera
c.pixelclock = 7;
c.aoi = [0 0 1280 1024];
c.exposure = 120;

define_aoi(c);
c.aoi
if ~exist('imgs','var')
    imgs = capture_images(c, 51);
end

mimg = mean(imgs,1);
showimage(mimg, 'Offset Image');

vimg = var(imgs,1);
showimage(vimg, 'Variance Image');

set_centered_aoi(c, [100 100])
es = c.exposurerange(1):20*c.exposurerange(2):c.exposurerange(3);

means = zeros(length(imgs),1);
vars = zeros(length(imgs),1);
for e=1:length(es)
    c.exposure = es(e);
    eimgs = capture_images(c, 100);
    means(e) = mean(eimgs(:));
    vars(e) = var(eimgs(:));
end

figure;
title('Mean vs. Exposure time');
plot(es, means);
figure;
title('Variance vs. Exposure time');
plot(es, vars);

