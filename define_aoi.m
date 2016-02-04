function aoi = define_aoi( c )
%DEFINE_AOI Define an area-of-interest using the mouse

f = showimage(c.capture', 'Click on the upper-left and lower-right');
[x,y] = ginput(2);
close(f);
x = round(x);
y = round(y);
aoi = [min(x), min(y), 4 * round(abs(x(1)-x(2))/4), 4*round(abs(y(1) - y(2))/4)];

end

