if ~exist('place', 'var')
    place = 'all';
end

if strcmp(place, 'all') || strcmp(place, 'part1')
if ~exist('c','var')
    c = MockCamera(0, 'lens on');
end
%Assumes c has been initialized to Camera or MockCamera
c.pixelclock = 7;
c.aoi = [0 0 1280 1024];
c.exposure = 120;

if ~exist('imgs','var')
    imgs = capture_images(c, 51);
end

mimg = mean(imgs,1);
showimage(mimg, 'Offset Image');

vimg = var(imgs,1);
showimage(vimg, 'Variance Image');

%set_centered_aoi(c, [100 100])
c.aoi = [590 462 100 100];
es = c.exposurerange(1):20*c.exposurerange(2):c.exposurerange(3);
means = zeros(size(es,2),1);
vars = zeros(size(es,2),1);
for e=1:length(es)
    c.exposure = es(e);
    eimgs = capture_images(c, 100);
    means(e) = mean(eimgs(:));
    vars(e) = var(eimgs(:));
end

means
vars

figure;
title('Mean vs. Exposure time');
plot(es, means);
figure;
title('Variance vs. Exposure time');
plot(es, vars);

end
if strcmp(place,'all') || strcmp(place,'part2')
    c.aoi = [0 0 1280 1024];
    c.exposure = 30;
    if ~exist('imgs_p2', 'var')
        imgs_p2 = capture_images(c, 100);
        mean_p2 = mean(imgs_p2,1);
        var_p2 = var(imgs_p2, 1);
    end

    showimage(mean_p2, 'Mean for 30 ms Exposure');
    showimage(var_p2, 'Variance for 30 ms Exposure');
    c.aoi = [50 300 100 100];
    if ~exist('SNR','var')
    SNR = zeros(length(es),3);

    for index = 1:length(es)
        c.exposure = es(index);
        expoImg = capture_images(c, 100);
        SNR(index,1) = mean(expoImg(:));
        SNR(index,2) = sqrt(var(expoImg(:)));
    end
    SNR(:,3) = SNR(:,1) ./ SNR(:,2);
    end
    figure();
    plot(es, SNR(:,3));
    title('SNR vs exposure');

    %save('lab1_vars.mat', 'SNR');
    c.aoi = [50 400 100 100];

    full_part2 = capture_images(c, 50);
    mf2 = mean(full_part2(:));
    vf2 = var(full_part2(:));
    mf2 / sqrt(vf2)
end
save('lab_1.mat');
