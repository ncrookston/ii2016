function exposure = auto_expose(c, neach)
if nargin < 2
    neach = 100;
end
oaoi = c.aoi;
c.aoi = [0 0 1280 1024];
c.aoi = define_aoi(c);

es = c.exposurerange(1):20*c.exposurerange(2):c.exposurerange(3);
means = zeros(length(es),1);
vars = zeros(length(es),1);
for e=1:length(es)
    c.exposure = es(e);
    eimgs = capture_images(c, neach);
    means(e) = mean(eimgs(:));
    vars(e) = var(eimgs(:));
end
snr = means ./ sqrt(vars);
[~,idx] = max(snr);
exposure = es(idx);
c.aoi = oaoi;