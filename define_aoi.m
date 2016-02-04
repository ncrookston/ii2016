function define_aoi( c )
%DEFINE_AOI Define an area-of-interest using the mouse

showimage(c.capture', 'Click on the upper-left and lower-right');
[x,y] = ginput(2);

c.aoi = [min(x), min(y), 4 * mod(abs(x(1)-x(2)), 4), 4*mod(abs(y(1) - y(2)),4)];

end

