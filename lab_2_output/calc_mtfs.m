e2 = edge2_angle1_mean;
e2_aoi = [500 300 1280 1000];

e4 = edge4_angle1_mean;
e4_aoi = [900 100 1100 900];

e8 = edge8_angle1_mean;
e8_aoi = [900 100 1100 900];

get_mtf2(e2, e2_aoi);
%get_mtf2(e4, e4_aoi);
%get_mtf2(e8, e8_aoi);
