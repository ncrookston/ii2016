function set_centered_aoi( c, aoisize )
%GET_CENTERED_AOI Given an AOI size, sets the aoi to a centered region.
    c.aoi = [(1024 - aoisize(2)) / 2, (1280 - aoisize(1)) / 2, aoisize(1), aoisize(2)];
end

