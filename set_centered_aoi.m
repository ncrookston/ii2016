function aoi = set_centered_aoi( aoisize )
%GET_CENTERED_AOI Given an AOI size, sets the aoi to a centered region.
    aoi = [(1024 - aoisize(2)) / 2, (1280 - aoisize(1)) / 2, aoisize(1), aoisize(2)];
end

