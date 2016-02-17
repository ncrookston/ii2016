
%part 1
% nf = 1000;
% img = nCapture(7,set_centered_aoi([100,100]),25,nf,0);
% mean_img = mean(img,3);
% dif = double(img)-repmat(mean_img,1,1,nf);
% center_dif = dif(50,50,:);
% cov = mean(repmat(center_dif,100,100,1).*dif,3);

%part2
nf = 5000;
img_3_5000 = nCapture(7,[400 100 100 100],25,nf,0);
mean_img = mean(img_3_5000,3);
dif = double(img_3_5000)-repmat(mean_img,1,1,nf);
center_dif = dif(50,50,:);
cov_focus_5000 = mean(repmat(center_dif,100,100,1).*dif,3);